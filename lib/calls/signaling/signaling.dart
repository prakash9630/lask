import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

typedef StreamStateCallback = void Function(MediaStream stream);

class Signaling {
  var configuration = {
    'iceServers': [
      {
        'urls': 'turn:turn.lask.asparksys.cloud',
        'username': 'asparkadmin',
        'credential': 'somepassword'
      },
    ]
  };

  RTCPeerConnection? peerConnection;
  MediaStream? localStream;
  MediaStream? remoteStream;
  String? roomId;
  String? currentRoomText;
  StreamStateCallback? onAddRemoteStream;

  Future<String> createRoom(RTCVideoRenderer remoteRenderer,
      {void Function(RTCPeerConnectionState state)? onConnected}) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    DocumentReference roomRef = db.collection('rooms').doc();

    log('Create PeerConnection with configuration: $configuration');

    peerConnection = await createPeerConnection(configuration);

    registerPeerConnectionListeners(onConnected: onConnected);

    localStream?.getTracks().forEach((track) {
      peerConnection?.addTrack(track, localStream!);
    });

    // Code for collecting ICE candidates below
    var callerCandidatesCollection = roomRef.collection('callerCandidates');

    peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
      log('Got candidate: ${candidate.toMap()}');
      callerCandidatesCollection.add(candidate.toMap());
    };
    // Finish Code for collecting ICE candidate

    // Add code for creating a room
    RTCSessionDescription offer = await peerConnection!.createOffer();
    await peerConnection!.setLocalDescription(offer);
    log('Created offer: $offer');

    Map<String, dynamic> roomWithOffer = {'offer': offer.toMap()};

    await roomRef.set(roomWithOffer);
    roomId = roomRef.id;
    log('New room created with SDK offer. Room ID: $roomId');
    currentRoomText = 'Current room is $roomId - You are the caller!';
    // Created a Room

    peerConnection?.onTrack = (RTCTrackEvent event) {
      log('Got remote track: ${event.streams[0]}');

      event.streams[0].getTracks().forEach((track) {
        log('Add a track to the remoteStream $track');
        remoteStream?.addTrack(track);
      });
    };

    // Listening for remote session description below
    roomRef.snapshots().listen((snapshot) async {
      log('Got updated room: ${snapshot.data()}');

      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>;
      if (peerConnection?.getRemoteDescription() != null &&
          data['answer'] != null) {
        var answer = RTCSessionDescription(
          data['answer']['sdp'],
          data['answer']['type'],
        );
        log("Someone tried to connect");
        await peerConnection?.setRemoteDescription(answer);
      }
    });
    // Listening for remote session description above

    // Listen for remote Ice candidates below
    roomRef.collection('calleeCandidates').snapshots().listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          Map<String, dynamic> data = change.doc.data() as Map<String, dynamic>;
          log('Got new remote ICE candidate: ${jsonEncode(data)}');
          peerConnection!.addCandidate(
            RTCIceCandidate(
              data['candidate'],
              data['sdpMid'],
              data['sdpMLineIndex'],
            ),
          );
        }
      }
    });
    // Listen for remote ICE candidates above

    return roomId!;
  }

  Future<void> openUserMedia(
    RTCVideoRenderer localVideo,
    RTCVideoRenderer remoteVideo,
  ) async {
    var stream = await navigator.mediaDevices.getUserMedia({
      'video': true,
      'audio': true,
    });

    localVideo.srcObject = stream;
    localStream = stream;

    remoteVideo.srcObject = await createLocalMediaStream('key');
  }

  void muteCam() {
    localStream?.getVideoTracks()[0].enabled =
        !(localStream!.getVideoTracks()[0].enabled);
  }

  bool remoteVideoEnable() {
    if (remoteStream?.getVideoTracks()[0].enabled == true) {
      return true;
    } else {
      return false;
    }
  }

  void muteMic(bool mute) {
    localStream?.getAudioTracks()[0].enabled =
        !(localStream!.getAudioTracks()[0].enabled);
  }

  void flipCamera() {
    if (localStream != null) {
      if (localStream!.getVideoTracks().isNotEmpty) {
        Helper.switchCamera(localStream!.getVideoTracks().first);
      }
    }
  }

  Future<void> hangUp(RTCVideoRenderer localVideo) async {
    List<MediaStreamTrack> tracks = localVideo.srcObject!.getTracks();
    for (var track in tracks) {
      track.stop();
    }
    if (remoteStream != null) {
      remoteStream!.getTracks().forEach((track) => track.stop());
    }
    if (peerConnection != null) peerConnection!.close();
    if (roomId != null) {
      var db = FirebaseFirestore.instance;
      var roomRef = db.collection('rooms').doc(roomId);
      var calleeCandidates = await roomRef.collection('calleeCandidates').get();
      for (var document in calleeCandidates.docs) {
        document.reference.delete();
      }

      var callerCandidates = await roomRef.collection('callerCandidates').get();
      for (var document in callerCandidates.docs) {
        document.reference.delete();
      }

      await roomRef.delete();
    }

    localStream!.dispose();
    remoteStream?.dispose();
  }

  deleteRoomId(roomId) async {
    var db = FirebaseFirestore.instance;
    var roomRef = db.collection('rooms').doc(roomId);
    var callerCandidates = await roomRef.collection('callerCandidates').get();
    for (var document in callerCandidates.docs) {
      document.reference.delete();
    }
    await roomRef.delete();
  }

  void registerPeerConnectionListeners(
      {void Function(RTCPeerConnectionState state)? onConnected}) {
    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      print('ICE gathering state changed: $state');
    };

    peerConnection?.onConnectionState = (RTCPeerConnectionState state) {
      print('Connection state change: $state');
      if (onConnected != null) {
        onConnected(state);
      }
    };

    peerConnection?.onSignalingState = (RTCSignalingState state) {
      print('Signaling state change: $state');
    };

    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      print('ICE connection state change: $state');
    };

    peerConnection?.onAddStream = (MediaStream stream) {
      print("Add remote stream");
      onAddRemoteStream?.call(stream);
      remoteStream = stream;
    };
  }

  void sendFileViaWebRTC(File file, RTCPeerConnection peerConnection) async {
    try {
      // Read the file as bytes
      List<int> fileBytes = await file.readAsBytes();

      RTCDataChannelInit dataChannelInit = RTCDataChannelInit();
      RTCDataChannel? dataChannel =
          await peerConnection.createDataChannel('file', dataChannelInit);

      log("Data State Is ${dataChannel.state}");

      // Send the file data in chunks
      int chunkSize = 16384; // Adjust as per your requirements
      int offset = 0;
      while (offset < fileBytes.length) {
        int chunkEnd = offset + chunkSize;
        if (chunkEnd > fileBytes.length) {
          chunkEnd = fileBytes.length;
        }
        List<int> chunkData = fileBytes.sublist(offset, chunkEnd);
        String base64Data = base64Encode(chunkData);

        dataChannel.send(RTCDataChannelMessage(base64Data));
        offset += chunkSize;

        // Calculate and display progress if needed
        double progress = offset / fileBytes.length;
        print('Progress: ${(progress * 100).toStringAsFixed(2)}%');
      }

      // Close the data channel after sending the file
      dataChannel.close();
    } catch (e) {
      // Handle any errors that occur during file transfer
      print('Error sending file: $e');
    }
  }

  void receiveFileViaWebRTC(RTCPeerConnection peerConnection) {
    RTCDataChannel? dataChannel;
    peerConnection.onDataChannel = (channel) {
      dataChannel = channel;
      dataChannel!.onMessage = (message) {
        if (message.isBinary) {
          List<int> chunkData = message.binary;
          // convertChunkDataToFile(chunkData);
        }
      };
    };
  }

  void holdCall() {
    remoteStream?.getTracks().forEach((track) {
      track.enabled = false;
    });
    localStream?.getTracks().forEach((track) {
      track.enabled = false;
    });
  }

  void resumeCall() {

    remoteStream?.getTracks().forEach((track) {
      track.enabled = true;
    });
    localStream?.getTracks().forEach((track) {
      track.enabled = true;
    });
  }
}
