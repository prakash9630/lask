import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/profile/provider/profile_provider.dart';
import 'package:lask_client/features/profile/widget/profile_menu_view.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_cached_image.dart';
import 'package:lask_client/widgets/profile_image_change_dialog.dart';
import '../../base_page/provider/bottom_nav_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileProv = ref.watch(profileProvider);
    var bottomProv = ref.watch(navProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          profileProv.getData();
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height + 130,
            child: Stack(
              children: [
                Image.asset(AssetPath.profileBackground),
                AppBar(
                  title: Center(
                    child: textW600S20(
                      label: "My Profile",
                      color: AppColors.whiteColor,
                    ),
                  ),
                  actions: [
                    InkWell(
                        onTap: () {
                          context.router.push(const EditProfileRoute());
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(right: 20.w),
                          child: SvgPicture.asset(AssetPath.editIcon),
                        ))
                  ],
                  leading: InkWell(
                      onTap: () {
                        bottomProv.changeNavIndex(0);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.whiteColor,
                      )),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                Positioned(
                    top: 149.h,
                    left: 0.w,
                    child: Image.asset(AssetPath.profileBlueDecor)),
                Positioned(
                    top: 115.h,
                    left: 0.w,
                    child: Image.asset(AssetPath.profileGreyDecor)),
                Positioned(
                    top: 112.h,
                    right: 0,
                    child: Image.asset(AssetPath.profileHalfGreyDecor)),
                Positioned(
                    top: 0.h,
                    left: 10.w,
                    child: Image.asset(AssetPath.profileQutarDecor)),
                Positioned(
                  top: 205.h,
                  left: 0.w,
                  right: 0.w,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration:  BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.r),
                            topLeft: Radius.circular(40.r))),
                  ),
                ),
                Positioned(
                  top: 140.h,
                  left: 0.w,
                  right: 0.w,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              ClipOval(
                                child: Container(
                                    color: profileProv.model?.userImage != null
                                        ? Colors.white
                                        : Colors.transparent,
                                    padding:  EdgeInsets.all(3.w),
                                    child: CustomCachedImage(
                                      imageUrl:
                                          profileProv.model?.userImage ?? "",
                                      showFullImage: true,
                                      height: 130.w,
                                      width: 130.w,
                                      borderRadius: 65.r,
                                    )),
                              )
                            ],
                          ),
                          Positioned(
                              bottom: 10.h,
                              right: 0,
                              child: GestureDetector(
                                  onTap: () {
                                    profileImageChangeDialog(context);
                                  },
                                  child:
                                      SvgPicture.asset(AssetPath.iconCamera)))
                        ],
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      textW600S16(label: profileProv.model?.fullName ?? ""),
                       SizedBox(
                        height: 7.h,
                      ),
                      textW400S13(label: profileProv.model?.phoneNumber ?? ""),
                       SizedBox(
                        height: 5.h,
                      ),
                      textW400S13(label: profileProv.model?.email ?? ""),
                       SizedBox(
                        height: 25.h,
                      ),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return ProfileMenuView(
                              menu: profileProv.profileMenu[index]);
                        },
                        separatorBuilder: (context, index) {
                          return  Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: Divider(
                              thickness: 1.h,
                              color: AppColors.containerBorder,
                            ),
                          );
                        },
                        itemCount: profileProv.profileMenu.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      //// profile list menus
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
