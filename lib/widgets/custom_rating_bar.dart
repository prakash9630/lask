import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lask_client/core/consts/colors.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar(
      {Key? key,
      required this.starSize,
      this.ignoreGesture = false,
      this.initialRating = 0,
        this.padding,
      required this.ratingUpdate})
      : super(key: key);

  final double starSize;
  final bool ignoreGesture;
  final double initialRating;
  final double? padding;
  final void Function(double) ratingUpdate;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        unratedColor: AppColors.ratingStarSecondColor,
        glowColor: AppColors.ratingStarFirstColor,
        glowRadius: 3.0,
        glow: true,
        itemSize: starSize,
        initialRating: initialRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        ignoreGestures: ignoreGesture,
        itemCount: 5,
        itemPadding:  EdgeInsets.symmetric(horizontal: padding??1.0),
        itemBuilder: (context, _) => const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
            ),
        onRatingUpdate: ratingUpdate);
  }
}
