import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/home_page/widget/widget_collections.dart';
import 'package:lask_client/helper/utils/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/consts/asset_path.dart';
import '../../../helper/widit_util/widget_util.dart';
import '../../../widgets/custom_cached_image.dart';
import '../../profile/provider/profile_provider.dart';
import '../model/menu_item.dart';
import '../provider/home_page_notifier.dart';
import 'home_page_menu.dart';
import 'home_shimmer.dart';
import 'lawer_info_widget.dart';

class HomeAppBar extends ConsumerWidget {
   HomeAppBar({Key? key}) : super(key: key);

  final List<MenuItems> menus=[
     MenuItems(icon: AssetPath.lawIcon, title: 'Our Services',page: OurServicesRoute()),
     MenuItems(icon: AssetPath.lawerIcon, title: 'My Lawyers',page:  MyLawyerRoute()),
     MenuItems(icon: AssetPath.invoiceIcon, title: 'My invoices',page: const MyInvoiceRoute()),
     MenuItems(icon: AssetPath.tariffsIcon, title:'Tariffs',page: const TariffsRoute()),
   ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileProv= ref.watch(profileProvider);
    final homeProv= ref.watch(homePageNotifyProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:
              Center(child: Image.asset(AssetPath.appTitle, fit: BoxFit.cover)),
          toolbarHeight: 75.h,
          leading: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              padding:  EdgeInsets.only(
                  left: 24.0.w, right: 8.0.w, bottom: 8.0.h, top: 8.0.h),
              child: SvgPicture.asset(
                AssetPath.drawerIcon,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
              context.router.push(const NotificationRoute());
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: 8.0.w, right: 24.0.w, bottom: 8.0.h, top: 8.0.h),
                child: SvgPicture.asset(
                  AssetPath.notificationIcon,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(23.r),
          child: Row(children: [
            if(profileProv.model?.fullName!=null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                "Good Morning",
                style:
                normalHeaderStyle(),
              ),
              Text(
                "${profileProv.model?.fullName}!",
                style:
                boldHeaderStyle(),
              )
            ],),
            const Spacer(),
            ClipOval(
              child: Container(
                padding: EdgeInsets.all(3.r),
                color: Colors.white,
                child: CustomCachedImage(imageUrl: profileProv.model?.userImage??"",
                  height: 75.w,
                  width: 75.w,
                  showFullImage: true,
                  borderRadius: 75.r,
                )
              ),
            ),
             hSpacer(47.h),

          ],),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.h),
          child: GridView.builder(
            padding:  EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menus.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1.25),
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.w
              ),
              itemBuilder: (context, index){
                return HomePageMenu(menu: menus[index],);
              }
          ),
        ),
        hSpacer(35.h),
       homeProv.status.maybeWhen(orElse: (){
         return Padding(
           padding: EdgeInsets.symmetric(horizontal: 23.h),
           child: const HomeShimmer(),
         );
       },success: (){
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             homeTitle(label: 'Last Called Lawyers'),
             hSpacer(20.h),
             ListView.separated(
                 shrinkWrap: true,
                 padding: EdgeInsets.zero,
                 physics: const NeverScrollableScrollPhysics(),
                 itemBuilder: (context,index){
                   var data=homeProv.recentCalls![index];
                   // return CallLawyerView(recentCalls: data,);
                   return LawyerInfoWidget(lawyers: data.lawyer,purpose: data.service,);
                 },
                 separatorBuilder: (context,index){
                   return SizedBox(height: 15.h,);
                 },
                 itemCount: homeProv.recentCalls!.length)
           ],
         );
       })
      ],
    );
  }
}
