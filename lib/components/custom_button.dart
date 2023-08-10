import 'package:flutter/material.dart';
import '../core/consts/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.radius,
      this.width,
      this.height,
      this.fontSize,
      this.color,
      this.leadingIcon,
      this.trailingIcon})
      : super(key: key);
  final VoidCallback? onPressed;
  final String label;
  final double? radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? color;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    var elevatedButtonStyleFrom = ElevatedButton.styleFrom(
      backgroundColor: color ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.0),
      ),
    );
    var widget = Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize ?? 16,
        fontWeight: FontWeight.w500,
      ),
    );
    return SizedBox(
      height: height ?? 48,
      width: width ?? double.infinity,
      child: _getWidget(elevatedButtonStyleFrom, widget),
    );
  }

  ElevatedButton _getWidget(
    ButtonStyle elevatedButtonStyleFrom,
    Text widget,
  ) {
    if (leadingIcon != null) {
      return ElevatedButton.icon(
        style: elevatedButtonStyleFrom,
        onPressed: onPressed,
        label: widget,
        icon: leadingIcon!,
      );
    }
    if (trailingIcon != null) {
      return ElevatedButton(
        style: elevatedButtonStyleFrom,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [widget, trailingIcon!],
        ),
      );
    }
    return ElevatedButton(
      style: elevatedButtonStyleFrom,
      onPressed: onPressed,
      child: widget,
    );
  }
}
