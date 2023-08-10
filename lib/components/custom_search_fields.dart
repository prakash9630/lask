
import 'package:flutter/material.dart';

import '../core/consts/colors.dart';

class CustomSearchField extends StatelessWidget {
  CustomSearchField(
      {Key? key,
      this.onSubmitted,
      this.radius,
      this.showPrefix = true,
      this.autoFocus = false,
      this.controller,
        this.hintText,
        this.focusNode,
      this.ontap})
      : super(key: key);
  final void Function(String?)? onSubmitted;
  final double? radius;
  final bool showPrefix;
  final String? hintText;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        focusNode: focusNode,
        onTap: ontap,
        cursorColor: AppColors.primaryColor,
        textInputAction: TextInputAction.search,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.0),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.0),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.0),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          prefixIcon: showPrefix
              ? Container(
                  margin: const EdgeInsets.only(left: 16.67, right: 14.0),
                  child: const  Icon(Icons.search),
                )
              : null,
          hintStyle: const TextStyle(
            color: AppColors.searchHintTextColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
