import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:lask_client/calls/model/payment_verify_model.dart';
import 'package:lask_client/calls/repo/call_repo.dart';
import 'package:lask_client/calls/screens/verifying_payment_page.dart';
import 'package:lask_client/calls/screens/video_view_page.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/home_page/model/hompage_model.dart';
import 'package:lask_client/features/profile/provider/profile_provider.dart';
import 'package:lask_client/features/tariffs/widget/tariffs_dialogue.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../core/consts/colors.dart';
import '../../core/consts/endpoints.dart';
import '../../core/repo/payment_repo.dart';
import '../../core/routes/app_routes.dart';
import '../../core/storage/secure_storage.dart';
import '../../core/storage/shared_constants.dart';
import '../../features/gift_vouchers/repo/voucher_repo.dart';
import '../../features/profile/model/profile_model.dart';
import '../../widgets/custom_cached_image.dart';
import '../model/chat_detail_data_model.dart';
import '../provider/message_notifier.dart';
import '../signaling/signaling.dart';
import '../widgets/chat_detail_dialog.dart';
import '../widgets/widgets.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/icons/bi.dart';

@RoutePage()
class CallPage extends ConsumerStatefulWidget {
  const CallPage(
      {Key? key,
      this.lawyers,
      this.tariffsId,
      this.serviceId,
      this.giftVoucherId})
      : super(key: key);
  final Lawyer? lawyers;
  final int? tariffsId;
  final int? serviceId;
  final int? giftVoucherId;

  @override
  ConsumerState<CallPage> createState() => _CallPageState();
}

class _CallPageState extends ConsumerState<CallPage> {
  Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  bool isCameraOpening = true;
  bool createRoom = false;
  bool joinRoom = false;
  bool isConnected = false;
  bool paymentVerified = false;
  bool? verifyFail;
  bool isMicOn = true;
  int flag = 0;
  final audioPlayer = AudioPlayer();
  final warningSound = AudioPlayer();
  int _currentCount = 0;
  late Timer _timer;
  int flagOne = 0;
  Timer? callTimer;
  Timer? holdTimer;
  Timer? subscribedTimer;
  int _subscribeTime = 0;
  int? callId;
  bool isOnHold = false;
  bool _isRunning = false;
  bool? _isRemoteVideOn;
  int? chargeId;
  PaymentVerifyModel? verifyModel;
  WebSocketChannel? channel;
  ProfileModel? user;
  bool inChatPage = false;
  bool showMsgIcon = false;
  bool preHold = false;
  int holdSec = 120;

  // int testHoldSec = 20;
  int holdSecondOutOfTwoMin = 0;
  int remainingSeconds = 0;
  Timer? holdTimerCount;

  @override
  void initState() {
    super.initState();
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {
        _isRemoteVideOn = stream.getAudioTracks().isNotEmpty;
      });
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    await audioPlayer.dispose();
    subscribedTimer?.cancel();
    holdTimer?.cancel();
    holdTimerCount?.cancel();
    warningSound.stop();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (flag == 0) {
      await signaling.openUserMedia(_localRenderer, _remoteRenderer);
      await room();
      flag = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: paymentVerified
            ? isConnected
                ? VideoViewPage(
                    signaling: signaling,
                    callId: callId ?? 0,
                    isInHold: isOnHold,
                    preHold: preHold,
                    localRenderer: _localRenderer,
                    remoteRenderer: _remoteRenderer,
                    lawyers: widget.lawyers,
                    time: _currentCount,
                    onEndCall: () {
                      {
                        closeCallWhenConnected();
                      }
                    },
                    onHoldTap: () {
                      showTariffDialog(context, onConfirmPlan: (plan) async {
                        plan.dialogContext.router.pop();
                        await ref.read(callRepoProvider).recharge(map: {
                          "tariff_id": plan.tariffs.id,
                          "call_id": callId,
                        }).then((value) {
                          value.fold((l) {
                            showErrorToast(text: "Error");
                          }, (r) async {
                            setState(() {
                              paymentVerified = false;
                            });
                            await verifyPayment(r['charge_id'], true);
                          });
                        });
                      });
                    },
                    onSendMsgTap: () {
                      messageDialog();
                    },
                    showMsgIcon: showMsgIcon,
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(40),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: widget.lawyers != null
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AvatarGlow(
                                                endRadius: 117,
                                                glowColor:
                                                    AppColors.primaryColor,
                                                duration: const Duration(
                                                    milliseconds: 2000),
                                                repeatPauseDuration:
                                                    const Duration(
                                                        milliseconds: 100),
                                                repeat: true,
                                                showTwoGlows: true,
                                                child: CircleAvatar(
                                                  radius: 71,
                                                  child: CustomCachedImage(
                                                    fit: BoxFit.cover,
                                                    height: 150,
                                                    width: 150,
                                                    borderRadius: 71,
                                                    imageUrl: widget.lawyers
                                                            ?.user?.userImage ??
                                                        "",
                                                  ),
                                                ),
                                              ),
                                              const Text(
                                                "Calling...",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                widget.lawyers?.user
                                                        ?.fullName ??
                                                    "",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 19,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: textW600S18(
                                                label: 'Calling lawyers ...')),
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            color: AppColors.primaryColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CallsButtonWidget(
                                  iconifyIcon:
                                      isMicOn ? Bi.mic_fill : Bi.mic_mute_fill,
                                  onPressed: () async {
                                    setState(() {
                                      isMicOn = !isMicOn;
                                      signaling.muteMic(isMicOn);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                CallsButtonWidget(
                                  iconifyIcon: Ic.round_call_end,
                                  backgroundColor: AppColors.red,
                                  onPressed: () {
                                    closeCall();
                                  },
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                CallsButtonWidget(
                                  iconifyIcon: isCameraOpening
                                      ? Heroicons.video_camera_20_solid
                                      : Heroicons.video_camera_slash_solid,
                                  onPressed: () async {
                                    setState(() {
                                      isCameraOpening = !isCameraOpening;
                                    });
                                    signaling.muteCam();
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (isCameraOpening)
                        Positioned(
                            top: 60,
                            right: 23,
                            child: SizedBox(
                                height: 164,
                                width: 115,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.whiteColor,
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: RTCVideoView(
                                      _localRenderer,
                                      mirror: true,
                                      objectFit: RTCVideoViewObjectFit
                                          .RTCVideoViewObjectFitCover,
                                    )))),
                    ],
                  )
            : VerifyingPaymentPage(
                verifyFail: verifyFail == true,
                onRetry: () async {
                  await verifyPayment(chargeId!, false);
                },
              ),
      ),
    );
  }

  void diallerTimer() {
    callTimer = Timer(const Duration(seconds: (45)), handleCallTimeout);
  }

  void handleCallTimeout() {
    if (!isConnected) {
      showErrorToast(text: "Call Timeout : Call was not accepted or decline");
      closeCall();
    }
  }

  void callSubscribedDuration(int second) {
    //// pre hold timer/////
    subscribedTimer =
        Timer(Duration(seconds: (second - holdSec)), showCallAboutToHold);

 }

  showCallAboutToHold() {
    remainingSeconds = holdSec;
    playHoldSound();
    setState(() {
      preHold = true;
    });
    holdTimerCount = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      remainingSeconds--;
      if (remainingSeconds <= 0) {
        t.cancel();
        handelSubscriptionTimeOut();
      }
      holdSecondOutOfTwoMin = remainingSeconds;
    });
  }

  handelSubscriptionTimeOut() {
    showErrorToast(text: "Your call Limit has been finished");
    if (_isRunning) {
      pauseTimer();
      sendMessage("", inHold: true);
    }
    setState(() {
      isOnHold = true;
      signaling.holdCall();
    });
    holdTime();
  }

  void holdTime() {
    holdTimer = Timer(Duration(seconds: holdSec), holdTimeHandler);
  }

  void holdTimeHandler() {
    signaling.hangUp(_localRenderer);
  }

  void closeCall() {
    audioPlayer.stop();
    callTimer?.cancel();
    Navigator.pop(context);
    signaling.hangUp(_localRenderer);
  }

  void closeCallWhenConnected() {
    sendMessage('',
        endCall: true, userName: ref.read(profileProvider).model!.username);
    subscribedTimer?.cancel();
    callEndAndNavigate();
  }

  void callEndAndNavigate() {
    signaling.hangUp(_localRenderer);
    ref.read(messageNotifyProvider).channel?.sink.close();
    context.router.popAndPush(CallEndRoute(
      lawyerImg: widget.lawyers?.user?.userImage,
      totalSecond: _currentCount,
      id: roomId!,
      callerId: callId!,
    ));
  }
  void startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentCount++;
      });
      createLogInfo();
    });
  }
  void createLogInfo(){
    if(_currentCount==10){
      ref.read(callRepoProvider).callLogCreate(map: {
        "call": callId,
        "activity_type": "1 minute time log",
        "activity_description": "One minute has been passed"
      });
    }
    if(_currentCount==15){
        ref.read(callRepoProvider).callVerify(chargeId:chargeId!.toString()).then((value) {
          value.fold((l){
            callEndAndNavigate();
          }, (r){});
        });
    }
  }

  void pauseTimer() {
    _isRunning = false;
    _timer.cancel();
  }

  Future<void> playAudio() async {
    await audioPlayer.play(
      AssetSource(
        'audio/call.mp3',
      ),
      volume: 1.0,
    );
    audioPlayer.onPlayerComplete.listen((event) {
      audioPlayer.play(
        AssetSource('audio/call.mp3'),
      );
    });
    audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> playHoldSound() async {
    await warningSound.play(
      AssetSource(
        'audio/beep.mp3',
      ),
      volume: 2.0,
    );
  }

  void callDismiss(RTCVideoRenderer localVideo, {String? message}) {
    List<MediaStreamTrack> tracks = localVideo.srcObject!.getTracks();
    for (var track in tracks) {
      track.stop();
    }
    signaling.deleteRoomId(roomId);
    if (isConnected) {
      closeCallWhenConnected();
    } else {
      Navigator.pop(context);
    }
    if (message != null) {
      showBotDialog("Info", message);
    } else {
      showErrorToast(text: "Could not make call");
    }
  }

  Future<void> verifyPayment(int callReqId, bool isRecharge) async {
    Timer(const Duration(seconds: 1), () async {
      await ref
          .read(paymentRepoProvider)
          .paymentBackendVerify(callReqId, isRecharge: isRecharge)
          .then((value) {
        value.fold((l) {
          setState(() {
            verifyFail = true;
          });
          callDismiss(_localRenderer);
        },
            (r) async => {
                  verifyModel = PaymentVerifyModel.fromJson(r),
                  setState(() {
                    paymentVerified = true;
                  }),
                  if (!isRecharge)
                    {
                      _subscribeTime = (verifyModel!.duration!.toInt() * 60),
                      // _subscribeTime = 40,
                      if (!isConnected)
                        {
                          await playAudio(),
                        },
                      diallerTimer(),
                    }
                  else
                    {
                      //// after verification of recharge /////////
                      showToast(text: 'Recharge Successful'),
                      // callSubscribedDuration(20);
                      if (!_isRunning)
                        {
                          startTimer(),
                        },
                      sendMessage("", inHold: false),
                      if (!isOnHold)
                        {
                          holdTimerCount?.cancel(),
                          _subscribeTime =
                              (verifyModel!.duration!.toInt() * 60) +
                                  holdSecondOutOfTwoMin
                        }
                      else
                        {
                          _subscribeTime = (verifyModel!.duration!.toInt() * 60)
                        },
                      setState(() {
                        isOnHold = false;
                        preHold = false;
                        signaling.resumeCall();
                      }),
                      callSubscribedDuration(_subscribeTime),
                    }
                });
      });
    });
  }

  Future<void> room() async {
    if (!createRoom) {
      setState(() {
        createRoom = true;
      });
      roomId =
          await signaling.createRoom(_remoteRenderer, onConnected: (state) {
        if (state == RTCPeerConnectionState.RTCPeerConnectionStateConnected) {
          setState(() async {
            audioPlayer.stop();
            isConnected = true;
            createRoom = false;
            startTimer();
            initWebSocket();
            callSubscribedDuration(_subscribeTime);
            await ref
                .read(callRepoProvider)
                .getCallId(map: {"room_code": roomId}).then((value) {
              value.fold((l) => null, (r) {
                callId = r["call_id"];
              });
            });
          });
        }
        else if(state == RTCPeerConnectionState.RTCPeerConnectionStateDisconnected){
          closeCallWhenConnected();
        }
      });
      Map<String, dynamic> data = {
        "room_code": roomId,
        "user_device_id": ref.read(profileProvider).deviceId,
      };
      if (widget.tariffsId != null) {
        data['tariff_id'] = widget.tariffsId;
      }
      if (widget.lawyers != null) {
        data['lawyer_id'] = widget.lawyers!.id;
      }
      if (widget.serviceId != null) {
        data['service_id'] = widget.serviceId!;
      }
      if (widget.giftVoucherId != null) {
        data['gift_voucher_id'] = widget.giftVoucherId!;
      }

      Either<Failure, dynamic> response;
      if (widget.lawyers != null) {
        if (widget.giftVoucherId == null) {
          response = await ref.read(callRepoProvider).makeCall(map: data);
        } else {
          response =
              await ref.read(voucherRepoProvider).giftVoucherCall(data: data);
        }
      } else {
        if (widget.serviceId != null && widget.giftVoucherId == null) {
          response = await ref.read(callRepoProvider).makeRandomCall(map: data);
        } else {
          response =
              await ref.read(voucherRepoProvider).giftVoucherCall(data: data);
        }
      }
      response.fold((l) {
        callDismiss(_localRenderer, message: l.errorData['detail']);
      }, (r) async {
        if (widget.giftVoucherId == null) {
          chargeId = r['charge_id'];
          await verifyPayment(chargeId!, false);
        } else {
          setState(() {
            paymentVerified = true;
          });
          if (!isConnected) {
            await playAudio();
          }
          diallerTimer();
        }
      });
    }
  }

  void messageDialog() {
    setState(() {
      inChatPage = true;
      showMsgIcon = false;
    });
    showDialog(
        context: context,
        builder: (_) {
          return ChatDetailView(
            onMessageSent: (text, file) {
              sendMessage(text, file: file);
            },
          );
        }).then((value) {
      setState(() {
        inChatPage = false;
      });
    });
  }

  sendMessage(String text,
      {File? file, bool? inHold, bool? endCall, String? userName}) async {
    Map<String, dynamic> data = {
      "message": text,
      if (file != null) "file_name": file.path.fileName,
    };
    if (inHold != null) {
      data['inHold'] = inHold;
    }
    if (endCall != null) {
      data['endCall'] = true;
    }
    if (userName != null) {
      data['username'] = userName;
    }

    if (file != null) {
      log(file.path);
      loading();

      var imageData = await ref.read(callRepoProvider).postImage(file: file);
      loading(visible: false);
      log("\n\n******************************\n\nDATAS\n\n******************************\n\n");
      log(imageData.toString());
      var dd = {
        "file_url": imageData?['url'],
      };
      data.addAll(dd);
      log(data.toString());
      ref.read(messageNotifyProvider).channel?.sink.add(jsonEncode(data));
    } else {
      ref.read(messageNotifyProvider).channel?.sink.add(jsonEncode(data));
    }
  }
  Future<void> initWebSocket() async {
    try {
      log("Initializing Web Socket");
      user = ref.read(profileProvider).model;
      final messageProv = ref.read(messageNotifyProvider.notifier);
      messageProv.clearChannel();
      String? token = await SecureStorage.getData(SharedConstants.access);
      final wsUrl = Uri.parse(
          Endpoints.socketUrl(widget.lawyers!.user!.username!, token!));
      // final wsUrl = Uri.parse("wss://socketsbay.com/wss/v2/1/demo/");
      channel = WebSocketChannel.connect(wsUrl);
      ref.read(messageNotifyProvider.notifier).setChannel(channel!);
      ref.read(messageNotifyProvider).channel?.stream.listen((message) {
        log("$message");
        var decodedMessage = jsonDecode(message);
        if (decodedMessage['endCall'] != null) {
          callEndAndNavigate();
        } else {
          ChatDetailDataModel? parsedData;
          try {
            parsedData = ChatDetailDataModel.fromJson(jsonDecode(message));
            // log(dd.runtimeType.toString());
            log("Parsed Data is ${parsedData.message}");
          } catch (e) {
            log("Unable To Parse $e");
          }

          if (!inChatPage &&
              parsedData?.inHold == null &&
              parsedData!.message.trim().isNotEmpty) {
            showMsgIcon = true;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: GestureDetector(
                    onTap: () {
                      messageDialog();
                    },
                    child: Text(parsedData.fileUrl != null
                        ? 'file received'
                        : parsedData.message)),
                duration: const Duration(
                    seconds:
                        2), // Set the duration for how long the SnackBar should be visible
              ),
            );
          }

          messageProv.addMessage(
            parsedData ??
                ChatDetailDataModel(
                  message: "$message",
                  dateTime: DateTime.now(),
                  username: user?.username,
                  showProcessing: true,
                ),
          );

          setState(() {});
        }
      }).onError((e) {});
    } catch (e) {
      log("\x1B[31m Errorrr  $e \x1B[0m");
      // showErrorToast(text: "Disconnected Socket");
    }
  }
}
