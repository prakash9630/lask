import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmers {
  static Widget shimmerWrapper(
    Widget child, {
    Color? baseColor,
    Color? highlightColor,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? const Color.fromARGB(255, 234, 232, 232),
      highlightColor:
          highlightColor ?? const Color.fromARGB(255, 247, 243, 243),
      child: child,
    );
  }

  static Widget containerShimmer({
    double height = 280,
    double? width,
    bool showBorder = true,
    Widget? child,
    bool isCircle = false,
    EdgeInsets? margin,
    double borderRadius = 10.0,
  }) {
    return SizedBox(
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 234, 232, 232),
        highlightColor: const Color.fromARGB(255, 247, 243, 243),
        direction: ShimmerDirection.ttb,
        child: Container(
          margin: margin,
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            color: const Color.fromARGB(255, 234, 232, 232),
            borderRadius: (showBorder && !isCircle)
                ? BorderRadius.circular(borderRadius)
                : null,
          ),
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }
}
