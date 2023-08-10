import 'package:flutter/material.dart';


import '../core/consts/colors.dart';
import '../core/model/dropdown_value_model.dart';

class CustomDropDownField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final List<DropdownValueModel> dropdownItems;
  final void Function(String?)? onChanged;

  final String? value;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final bool showRequired;
  final Color? titleColor;
  final double? borderRadius;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final bool isFilled;

  const CustomDropDownField({
    Key? key,
    required this.labelText,
    required this.dropdownItems,
    required this.onChanged,
    required this.hintText,
    this.showRequired = false,
    this.isFilled = false,
    this.titleColor,
    this.borderRadius,
    this.value,
    this.validator,
    this.fillColor,
    this.contentPadding,
    this.hintStyle,
  }) : super(key: key);

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  // String? _value;

  // @override
  // void initState() {
  //   if (widget.value != null) {
  //     _value = widget.value;
  //   }
  //   super.initState();
  // }

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
        DropdownButtonFormField<String>(
          value: widget.value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          items: widget.dropdownItems
              .map(
                (e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(
                    e.value,
                    style: const TextStyle(
                      // color: AppColors./,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => widget.dropdownItems
              .map(
                (e) => Text(
                  e.value,
                  style: e.key != null
                      ? const TextStyle(
                          fontWeight: FontWeight.w500,
                        )
                      : null,
                ),
              )
              .toList(),
          onChanged: widget.onChanged,
          validator: widget.validator,
          itemHeight: 50,

          icon: const Icon(Icons.arrow_drop_down_rounded),
          iconEnabledColor: AppColors.primaryColor,
          // style: const TextStyle(
          //   color: AppColors.primaryColor,
          //   fontWeight: FontWeight.w600,
          //   fontSize: 16,
          // ),
          decoration: InputDecoration(
            fillColor: widget.isFilled ? AppColors.fontGrey : Colors.white,
            filled: true,
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
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
          ),
        ),
      ],
    );
  }
}
