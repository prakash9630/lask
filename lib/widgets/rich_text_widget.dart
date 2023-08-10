import 'package:flutter/material.dart';

import '../core/consts/colors.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleFontSize,
    this.titleColor,
    this.valueFontSize,
    this.valueColor,
    this.valueFontWeight,
    this.titleFontWeight,
    this.maxlines,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final String value;

  final double? titleFontSize;
  final Color? titleColor;
  final FontWeight? titleFontWeight;

  final double? valueFontSize;
  final Color? valueColor;
  final FontWeight? valueFontWeight;
  final int? maxlines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxlines ?? 2,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      text: TextSpan(
        text: title,
        style: TextStyle(
          fontWeight: titleFontWeight ?? FontWeight.w500,
          fontSize: titleFontSize ?? 12,
          color: titleColor ?? AppColors.lightFontGrey,
          fontFamily: "Inter",
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor ?? Colors.black,
              fontSize: valueFontSize,
              fontWeight: valueFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
