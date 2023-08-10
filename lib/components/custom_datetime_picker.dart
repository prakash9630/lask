import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/consts/colors.dart';

class CustomDatetimePicker extends FormField<DateTime> {
  CustomDatetimePicker({
    super.key,
    required String labelText,
    required void Function(DateTime?)? onDatePicked,
    required String hintText,
    FormFieldValidator<DateTime?>? validator,
    DateTime? initialValue,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    TextStyle? labelStyle,
    bool isFilled = true,
    Color? hintTextColor,
    Color? titleColor,
    bool hasContainer = false,
    double? height,
    FontWeight? fontWeight,
    bool showRequired = false,
  }) : super(
          validator: validator,
          initialValue: initialValue,
          onSaved: onDatePicked,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<DateTime> state) {
            debugPrint('Initial date $initialValue');

            debugPrint('${state.value}');

            return Builder(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (labelText.isNotEmpty) ...[
                    RichText(
                      text: TextSpan(
                        text: labelText,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: titleColor ?? AppColors.fontGrey,
                          fontFamily: "Inter",
                        ),
                        children: [
                          if (showRequired) ...{
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
                  SizedBox(
                    height: height ?? (hasContainer ? 34 : 50),
                    child: dateTimeButton(
                      context,
                      state: state,
                      isFilled: isFilled,
                      lastDate: lastDate,
                      initialDate: initialDate,
                      firstDate: firstDate,
                      hintText: hintText,
                      hintTextColor: hintTextColor,
                      hasSide: hasContainer,
                      hasSuffixIcon: hasContainer,
                      fontWeight: fontWeight,
                    ),
                  ),
                  state.hasError
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8.0,
                          ),
                          child: Text(
                            state.errorText ?? "",
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 12,
                            ),
                          ),
                        )
                      : Container()
                ],
              );
            });
          },
        );
}

Widget dateTimeButton(
  BuildContext context, {
  required FormFieldState<DateTime> state,
  bool isFilled = false,
  Color? hintTextColor,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  FontWeight? fontWeight,
  required String hintText,
  bool hasSide = false,
  bool hasSuffixIcon = false,
}) {
  return Container(
    padding:
        hasSide ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      border: hasSide
          ? const Border(
              bottom: BorderSide(
                color: AppColors.borderColor,
              ),
            )
          : Border.all(
              width: 1.4,
              color:
                  state.hasError ? Colors.red.shade600 : AppColors.borderColor,
            ),
      borderRadius: hasSide ? null : BorderRadius.circular(10.0),
    ),
    child: InkWell(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: initialDate ?? lastDate ?? DateTime.now(),
          firstDate: firstDate ??
              DateTime(
                DateTime.now().year - 100,
              ),
          lastDate: lastDate ?? DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: AppColors.primaryColor,
                    ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          state.didChange(date);
          state.save();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            state.value != null
                ? DateFormat("MMM, d y").format(state.value!)
                : hintText,
            style: TextStyle(
              color: state.value != null
                  ? Colors.black
                  : hintTextColor ?? AppColors.borderColor,
              fontSize: 16.0,
              fontWeight: fontWeight,
            ),
          ),
          hasSuffixIcon
              ? const SizedBox()
              : Icon(
                  CupertinoIcons.calendar,
                  color: state.hasError
                      ? Colors.red.shade600
                      : AppColors.borderColor,
                  size: 18.0,
                ),
        ],
      ),
    ),
  );
}
