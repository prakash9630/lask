import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/consts/asset_path.dart';
import 'custom_shimmers.dart';
import 'image_viewer.dart';


class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    this.errorImage,
    this.fit,
    this.placeholderImage,
    this.showFullImage = false,
    this.backgroundColor,
    this.width,
    this.height,
    this.url,
    this.imageList,
    this.initialIndex = 0,
    this.borderRadius,
    this.hiroTag,
    this.isLoading = false,
  }) : super(key: key);

  final String imageUrl;
  final String? errorImage;
  final BoxFit? fit;
  final String? placeholderImage;
  final bool showFullImage;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final String? url;
  final List<String>? imageList;
  final int initialIndex;
  final double? borderRadius;
  final String? hiroTag;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading
          ? null
          : (url != null
              ? () {
                  launchUrl(Uri.parse(url!));
                }
              : (showFullImage
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageViewer(
                            imageList: imageList ?? [imageUrl],
                            initialPage: initialIndex,
                            type: ImageViewType.network,
                          ),
                        ),
                      );
                    }
                  : null)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        child: isLoading
            ? CustomShimmers.containerShimmer(
                width: width,
                borderRadius: borderRadius ?? 0,
                height: height ?? 280,
              )
            : Container(
                color:
                    backgroundColor ?? const Color.fromARGB(255, 252, 252, 252),
                width: width,
                height: height,
                child: Hero(
                  tag: hiroTag == null ? UniqueKey() : "$hiroTag",
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    errorWidget: (context, url, error) => Image.asset(
                      errorImage ?? AssetPath.logoWithTitle,
                    ),
                    fit: fit ?? BoxFit.cover,
                    width: width,
                    height: height,
                  ),
                ),
              ),
      ),
    );
  }
}
