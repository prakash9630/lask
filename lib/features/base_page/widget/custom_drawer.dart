import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/core/storage/shared_preferences.dart';
import 'package:lask_client/features/base_page/model/drawer_menu.dart';
import 'package:lask_client/features/base_page/widget/drawer_list.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_cached_image.dart';
import '../../../core/consts/colors.dart';
import '../../../core/provider/language_provider.dart';
import '../../../core/storage/shared_constants.dart';
import '../../../localization_export.dart';
import '../../profile/provider/profile_provider.dart';
import '../provider/drawer_provider.dart';
import 'common_divider.dart';
import 'language_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var drawer = ref.watch(drawerProvider);
    final profileProv= ref.watch(profileProvider);

    final l10n = AppLocalizations.of(context);
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      elevation: 0.0,
      child: Padding(
        padding: MediaQuery.of(context).viewPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: InkWell(
                        onTap: () => Scaffold.of(context).closeDrawer(),
                        child: SvgPicture.asset(
                          AssetPath.drawerIcon,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Center(
                            child: Image.asset(
                      AssetPath.drawerIconImg,
                    )))
                  ],
                ),
              ),
              // hSpacer(36.h),
              // Padding(
              //   padding:  EdgeInsets.only(left: 20.w),
              //   child: SizedBox(
              //     height: 30.h,
              //     child: ListView.builder(
              //         shrinkWrap: true,
              //         scrollDirection: Axis.horizontal,
              //         physics: const NeverScrollableScrollPhysics(),
              //         padding: EdgeInsets.zero,
              //         itemCount: drawer.lang.length,
              //         itemBuilder: (context, index) {
              //           return GestureDetector(
              //               onTap: () {
              //                 drawer.setLangIndex(index);
              //                 storeString(SharedConstants.lang, index==0?"en":"pt");
              //                 ref.read(langProvider.notifier).state=Locale(index==0?"en":"pt");
              //                     },
              //               child: LanguageContent(
              //                 lang: drawer.lang[index],
              //                 isSelected: drawer.lanIndex == index,
              //               ));
              //         }),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding:  EdgeInsets.only(top: 22.h, bottom: 25.h),
                      child: Row(
                        children: [
                          Container(
                            width: 67.w,
                            height: 67.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: CustomCachedImage(imageUrl: profileProv.model?.userImage??'',
                            borderRadius: 34.r,
                            showFullImage: true,),
                          ),
                           SizedBox(width: 15.w),
                          Expanded(
                            // width: 178,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(
                                  profileProv.model?.fullName??"",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style:  TextStyle(
                                    color: AppColors.black2CColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                 SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Scaffold.of(context).closeDrawer();
                                    context.router.push(const EditProfileRoute());
                                  },
                                  child: Text(
                                    l10n.viewProfile,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SvgPicture.asset(AssetPath.arrowRight)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const CommonDivider(),
                  ...List.generate(drawer.functionMenu.length, (index) {
                    return DrawerList(
                      menu: drawer.functionMenu[index],
                      showArrow: true,
                    );
                  }),
                  const CommonDivider(),
                  ...List.generate(drawer.infoMenu.length, (index) {
                    return DrawerList(
                      menu: drawer.infoMenu[index],
                      showArrow: false,
                    );
                  }),
                  if(drawer.page.isNotEmpty)
                  Column(
                    children: [
                      const CommonDivider(),
                      ...List.generate(drawer.page.length, (index) {
                        var pages=drawer.page[index];
                        return DrawerList(
                          pages: pages,
                          menu: DrawerMenu(title: pages.title??"",
                              icon: pages.icon,
                            isNetwork: true
                          ),
                        );
                      }),
                    ],
                  ),
                  const CommonDivider(),
                  DrawerList(
                    menu: DrawerMenu(
                        title: 'Logout',
                        icon: AssetPath.iconLogout,
                        page: const LoginRoute()),
                    showArrow: true,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
