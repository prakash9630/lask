import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../core/consts/colors.dart';
import '../core/model/dropdown_value_model.dart';


class CustomTypeaheadField extends StatefulWidget {
  final void Function(DropdownValueModel) onSuggestionSelected;
  final TextEditingController? controller;
  final String labelText;
  final FutureOr<Iterable<DropdownValueModel>> Function(String)
      suggestionCallback;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  final bool hasItems;
  final bool isFilled;
  final Color? fillColor;

  final String hintText;
  final TextStyle? labelStyle;
  final double labelGap;
  final Color? borderColor;
  final VoidCallback? onDeleteTap;

  const CustomTypeaheadField({
    Key? key,
    this.fillColor,
    required this.onSuggestionSelected,
    this.controller,
    this.borderColor,
    required this.labelText,
    required this.suggestionCallback,
    this.validator,
    this.onSaved,
    required this.hintText,
    required this.hasItems,
    this.labelStyle,
    this.isFilled = false,
    this.labelGap = 15.0,
    this.onDeleteTap,
  }) : super(key: key);

  @override
  State<CustomTypeaheadField> createState() => _CustomTypeaheadFieldState();
}

class _CustomTypeaheadFieldState extends State<CustomTypeaheadField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...{
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.fontGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: widget.labelGap,
          ),
        },
        TypeAheadFormField(
          // hideKeyboardOnDrag: true,
          // hideSuggestionsOnKeyboardHide: false,
          textFieldConfiguration: TextFieldConfiguration(
            controller: widget.controller,
            cursorColor: Colors.black,
            enabled: widget.hasItems,
            decoration: InputDecoration(
              // helperText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xffeeeeee),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xffeeeeee),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: widget.borderColor ?? const Color(0xffeeeeee),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.red.shade800,
                ),
              ),
              errorStyle: TextStyle(
                color: Colors.red.shade800,
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 12.0,
              ),
              suffixIcon:
                  widget.controller == null || widget.controller!.text.isEmpty
                      ? const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.fontGrey,
                        )
                      : widget.onDeleteTap == null
                          ? null
                          : InkWell(
                              onTap: widget.onDeleteTap,
                              child: const Icon(
                                Icons.clear,
                                color: AppColors.fontGrey,
                              ),
                            ),
            ),
          ),
          suggestionsCallback: widget.suggestionCallback,
          itemBuilder: (context, DropdownValueModel suggestion) {
            return ListTile(
              tileColor: Colors.white,
              title: Text(
                suggestion.value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          noItemsFoundBuilder: (context) {
            return ListTile(
              title: Text("No ${widget.labelText} Found"),
            );
          },
          onSuggestionSelected: widget.onSuggestionSelected,
          validator: widget.validator,
          onSaved: widget.onSaved,
        ),
      ],
    );
  }
}
