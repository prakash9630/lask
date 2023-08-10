import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../../core/consts/colors.dart';
import '../../features/home_page/model/hompage_model.dart';
import '../../helper/utils/app_utils.dart';
import '../../widgets/custom_cached_image.dart';
import '../repo/call_repo.dart';
import '../signaling/signaling.dart';
import '../widgets/recharge_hold_view.dart';
import '../widgets/widgets.dart';
import 'package:iconify_flutter/icons/bi.dart';
import '../widgets/calls_button_widget.dart';

class VideoViewPage extends ConsumerStatefulWidget {
  const VideoViewPage(
      {Key? key,
      required this.signaling,
      required this.localRenderer,
      required this.remoteRenderer,
      this.lawyers,
      required this.time,
      required this.callId,
      required this.isInHold,
        required this.showMsgIcon,
        required this.preHold,
        this.onEndCall,
      this.onHoldTap,
      this.onSendMsgTap})
      : super(key: key);
  final Signaling signaling;
  final RTCVideoRenderer localRenderer;
  final RTCVideoRenderer remoteRenderer;
  final Lawyer? lawyers;
  final int time;
  final int callId;
  final bool isInHold;
  final Function()? onHoldTap;
  final Function()? onSendMsgTap;
  final Function()? onEndCall;
  final bool showMsgIcon;
  final bool preHold;

  @override
  ConsumerState<VideoViewPage> createState() => _VideoViewPageState();
}

class _VideoViewPageState extends ConsumerState<VideoViewPage> {
  bool isVideo = true;
  bool isMicOn = true;
  bool isFrontCamera = true;
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    final callLogProv = ref.read(callRepoProvider);
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 100,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              child: widget.signaling.remoteVideoEnable()
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      child: RTCVideoView(
                        widget.remoteRenderer,
                        objectFit:
                            RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                      ))
                  : Center(
                      child:widget.lawyers!=null? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 71,
                            child: CustomCachedImage(
                              fit: BoxFit.cover,
                              height: 150,
                              width: 150,
                              borderRadius: 71,
                              imageUrl: widget.lawyers?.user?.userImage ?? "",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          textW600S20(
                              label: widget.lawyers?.user?.fullName ?? "",
                              color: AppColors.whiteColor)
                        ],
                      ): textW600S20(
                          label: "Lawyers Video is Off.",
                          color: AppColors.whiteColor),
                    )),
        ),
        if (isVideo)
          Positioned(
              top: 60,
              right: 23,
              child: SizedBox(
                  height: 164,
                  width: 115,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.whiteColor, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: RTCVideoView(
                          widget.localRenderer,
                          mirror: true,
                          objectFit:
                              RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                        )),
                  ))),
          Positioned(
            top: 55,
            left: 25,
            child: textW600S20(
                label: widget.time.formatTime,
                color: AppColors.whiteColor)),
        if (widget.preHold)
          Positioned(
              left: 23,
              right: 23,
              bottom: 200,
              child: RechargeHoldView(
                label:  !widget.isInHold?"Call will be interrupted in 2 minutes. Please recharge now.":null,
                onTap: () {
                  if (widget.onHoldTap != null) {
                    widget.onHoldTap!();
                  }
                },
              )),
        Positioned(
            left: 23,
            right: 23,
            bottom: 120,
            child: RechargeHoldView(
              showMsgIcon: widget.showMsgIcon,
              label: "Send Messages to ${widget.lawyers?.user?.fullName??"Lawyer"}",
              iconPath: AssetPath.sentIcon,
              onTap: () {
                if (widget.onSendMsgTap != null) {
                  widget.onSendMsgTap!();
                }
              },
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            color: AppColors.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CallsButtonWidget(
                  iconifyIcon: isVideo
                      ? Heroicons.video_camera_20_solid
                      : Heroicons.video_camera_slash_solid,
                  onPressed: () {
                    setState(() {
                      isVideo = !isVideo;
                    });
                    widget.signaling.muteCam();
                    callLogProv.callLogCreate(map: {
                      "call": widget.callId,
                      "activity_type": isVideo ? "Video On" : "Video Off",
                      "activity_description": ""
                    });
                  },
                ),
                const SizedBox(
                  width: 36,
                ),
                CallsButtonWidget(
                  iconifyIcon: isMicOn ? Bi.mic_fill : Bi.mic_mute_fill,
                  onPressed: () {
                    setState(() {
                      isMicOn = !isMicOn;
                    });
                    widget.signaling.muteMic(isMicOn);
                    callLogProv.callLogCreate(map: {
                      "call": widget.callId,
                      "activity_type": isMicOn ? "Mic On" : "Mic Off",
                      "activity_description": ""
                    });
                  },
                ),
                const SizedBox(
                  width: 36,
                ),
                CallsButtonWidget(
                  iconifyIcon: isFrontCamera
                      ? MaterialSymbols.flip_camera_ios_outline
                      : MaterialSymbols.flip_camera_ios,
                  onPressed: () {
                    setState(() {
                      isFrontCamera = !isFrontCamera;
                    });
                    widget.signaling.flipCamera();
                    callLogProv.callLogCreate(map: {
                      "call": widget.callId,
                      "activity_type":
                          isFrontCamera ? "Front Camera" : "Back Camera",
                      "activity_description": ""
                    });
                  },
                ),
                const SizedBox(
                  width: 36,
                ),
                CallsButtonWidget(
                    iconifyIcon: Ic.round_call_end,
                    backgroundColor: AppColors.red,
                    onPressed: widget.onEndCall),
              ],
            ),
          ),
        )
      ],
    );
  }
}
