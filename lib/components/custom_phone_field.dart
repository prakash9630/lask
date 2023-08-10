import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../core/consts/colors.dart';


class CustomPhoneField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool showRequired;
  final VoidCallback? onTap;
  final bool readOnly;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final bool isFilled;
  final bool isNewLabel;
  final TextAlign? textAlign;
  final double? borderRadius;
  final void Function(PhoneNumber)? onSubmitted;
  final void Function(PhoneNumber)? onChanged;
  final PhoneNumber? initialValue;
  final bool? autoFocus;
  final TextInputAction? textInputAction;
  final Color? titleColor;
  const CustomPhoneField({
    Key? key,
    required this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.showRequired = false,
    this.readOnly = false,
    this.onTap,
    this.contentPadding,
    this.isFilled = false,
    this.isNewLabel = false,
    this.onSubmitted,
    this.onChanged,
    this.initialValue,
    this.autoFocus = false,
    this.textInputAction,
    this.textAlign,
    this.borderRadius,
    this.hintStyle,
    this.titleColor,
  }) : super(key: key);

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          RichText(
            text: TextSpan(
              text: widget.labelText,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: widget.titleColor ?? AppColors.fontGrey,
                fontFamily: "Inter",
              ),
              children: [
                if (widget.showRequired) ...{
                  const TextSpan(
                    text: " *",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: AppColors.red,
                      fontFamily: "Inter",
                    ),
                  ),
                }
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
        InternationalPhoneNumberInput(
          onInputChanged: widget.onChanged,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
            trailingSpace: false,
            setSelectorButtonAsPrefixIcon: true,
            useEmoji: true,
            leadingPadding: 12
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(
            color: Colors.black,
          ),
          searchBoxDecoration: InputDecoration(
            labelText: "Search Country Or Code",
            border: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
          ),
          initialValue: widget.initialValue,
          textFieldController: widget.controller,
          formatInput: true,
          keyboardType: TextInputType.phone,
          onSaved: widget.onSubmitted,
          cursorColor: AppColors.fontGrey,
          inputDecoration: InputDecoration(
            fillColor: widget.isFilled ? AppColors.fontGrey : Colors.white,
            filled: true,
            errorMaxLines: 2,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            errorBorder: outlineInputBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red),
            ),
            disabledBorder: outlineInputBorder,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                const TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 12.0,
                ),
          ),
        ),
      ],
    );
  }
}
