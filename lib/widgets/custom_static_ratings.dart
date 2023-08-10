import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomStaticRating extends StatelessWidget {
     CustomStaticRating({Key? key,required this.initialRaging,this.size,this.ignoreGesture,this.allowHalfRating,this.padding,this.updateRatings}) : super(key: key);

     double initialRaging=0.0;
    double? size;
    bool? ignoreGesture;
    bool? allowHalfRating;
    double? padding;
    void Function(double rating)? updateRatings;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ignoreGestures: ignoreGesture??false,
      initialRating: initialRaging,
      direction: Axis.horizontal,
      itemSize: size??18,
      itemPadding: EdgeInsets.symmetric(horizontal: padding??0),
      allowHalfRating: allowHalfRating??true,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        half: const Icon(
          Icons.star_half,
          color: Colors.amber,
        ),
        empty: const Icon(
          Icons.star_border,
          color: Colors.amber,
        ),
      ),
      onRatingUpdate: (rating) {
        if(updateRatings!=null)updateRatings!(rating);
      },
    );
  }
}
