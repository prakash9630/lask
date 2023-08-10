import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../core/consts/colors.dart';

class CallsButtonWidget extends StatelessWidget {
  const CallsButtonWidget({
    super.key,
    this.onPressed,
    required this.iconifyIcon,
    this.backgroundColor,
  });

  final String iconifyIcon;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: onPressed,
      child: CircleAvatar(
        radius: 30,
        backgroundColor:
            backgroundColor ?? AppColors.lightBlue.withOpacity(0.8),
        child: Iconify(
          iconifyIcon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
