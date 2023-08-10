

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/about_us/provider/about_us_provider.dart';
import 'package:lask_client/features/about_us/widget/about_us_simmer.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/widgets/custom_cached_image.dart';
import '../../../widgets/custom_sliver_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

@RoutePage()
class AboutUsPage extends ConsumerWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final aboutUsProv= ref.watch(aboutUsProvider);

    return CustomSliverAppBar(title: 'About Us',
      child: aboutUsProv.when(
          data:(data){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  if(data?.images!=null)
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                      ),
                      items: data?.images?.map((e) {
                        return CustomCachedImage(imageUrl: e.image??"",);
                      }).toList()
                    ),
                  )
                  ,
                  const SizedBox(height: 15,),
                  Html(data: data?.content??"")
                ],
              ),
            );
          },
          error:(obj,stack){
            showErrorToast(text: "Error $obj");
            return const SizedBox.shrink();
          },
          loading:() => const AboutUsSimmer()));
  }
}
