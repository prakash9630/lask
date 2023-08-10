import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/widgets/custom_static_ratings.dart';
import '../../core/consts/colors.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/custom_cached_image.dart';
import '../repo/call_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
@RoutePage()
class CallEndPage extends HookConsumerWidget {
  const CallEndPage(
      {Key? key,
      required this.id,
      required this.totalSecond,
      required this.callerId,
      this.lawyerImg})
      : super(key: key);
  final String id;
  final int totalSecond;
  final int callerId;
  final String? lawyerImg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final callProv = ref.read(callRepoProvider);
    final selectedRating = useState<double?>(0);
    final textController = useTextEditingController();
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Padding(
          padding:  EdgeInsets.all(23.w),
          child: Column(
            children: [
              const Spacer(),
               Text(
                "Call Ended",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              Text(
                totalSecond.formatTimeToMinAndHr,
                style:  TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              const Spacer(),
               CircleAvatar(
                radius: 101.5.r,
                child:  CustomCachedImage(
                  borderRadius: 101.5.r,
                  imageUrl: lawyerImg??"",
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w),
                child: Text(
                  "Please rate your conversation with Christina Jeffery Devkota ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.black2CColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
               SizedBox(
                height: 30.h,
              ),
              CustomStaticRating(
                initialRaging: 0,
                size: 40.r,
                allowHalfRating: false,
                updateRatings: (ratings) {
                  selectedRating.value = ratings;
                },
                padding: 5,
              ),
           SizedBox(
            height: 30.h,
          ),
              if(selectedRating.value!=0 && selectedRating.value! <=3)
              CustomTextField(
                controller: textController,
                  labelText: "Comment",
                maxLines: 3,

              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(23),
          child: CustomButton(
            onPressed: (selectedRating.value != null && selectedRating.value! > 0)
                ? () async {
                    await callProv.callEnd(map: {
                      "duration": totalSecond,
                      "rating": selectedRating.value,
                      "review": textController.text
                    }, id: callerId.toString());
                    if (context.mounted) {
                      // context.router.pop();
                      context.router.popAndPush(const BaseRoute());
                    }
                  }
                : null,
            label: "Submit Ratings",
          ),
        ),
      ),
    );
  }
}
