import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lask_client/features/base_page/model/pages_model.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/consts/asset_path.dart';
import '../../../core/consts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.pages}) : super(key: key);
  final Pages pages;

  @override
  Widget build(BuildContext context) {
    return CustomPageHolder(
        title: pages.title ?? "",
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if(pages.infoPageImage!=null)
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                          ),
                          items: pages.infoPageImage?.map((e){
                            return CachedNetworkImage(imageUrl: e.image??"");
                          }).toList()
                      ),
                    ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 22.h),
                    child: Html(
                      data: pages.description ?? "",
                      onLinkTap: (link, map, element) {
                        launchUrl(Uri.parse(link!));
                      },
                      style: {
                        "body": Style(
                            fontSize: FontSize(14.0.sp),
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightGreyColor),
                      },
                    ),
                  ),
                  // textW500S14(label: pages.description ?? ""),
                ],
              ),
            )));
  }
}
