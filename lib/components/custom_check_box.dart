import 'package:flutter/material.dart';

import '../core/consts/colors.dart';
import '../core/model/dropdown_value_model.dart';


class CustomCheckbox extends FormField<bool> {
  CustomCheckbox({
    super.key,
    required String label,
    required void Function(bool) onChanged,
    TextStyle? labelStyle,
    String? subLabel,
    TextStyle? subTextStyle,
    FormFieldValidator<bool?>? validator,
    bool? initialValue,
    double size = 16,
    double fontSize = 12,
    Color labelColor = AppColors.fontGrey,
    Color unselectedBorderColor = AppColors.fontGrey,
    Color selectedBorderColor = AppColors.secondaryColor,
    BorderRadius? borderRadius,
    double? borderWidth,
  }) : super(
            onSaved: (v) => onChanged.call(v ?? false),
            initialValue: initialValue ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            builder: (FormFieldState<bool> state) {
              return GestureDetector(
                onTap: () {
                  bool v = state.value ?? false;
                  state.didChange(!v);
                  state.save();
                  debugPrint('${state.value}');
                  // setState(() {
                  //   isChecked = !isChecked;
                  // });
                  // onChanged.call(isChecked);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(4.0),
                        border: Border.all(
                          color: isChecked(state.value)
                              ? selectedBorderColor
                              : unselectedBorderColor,
                          width: borderWidth ?? 1.2,
                        ),
                        color:
                            isChecked(state.value) ? selectedBorderColor : null,
                      ),
                      child: isChecked(state.value)
                          ? Icon(
                              Icons.check,
                              size: size - 4,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: label,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: labelColor,
                            fontFamily: "Inter",
                          ),
                          children: [
                            if (subLabel != null)
                              TextSpan(
                                text: " $subLabel",
                                style: subTextStyle,
                              )
                          ],
                        ),
                      ),
                    )
                    // Flexible(
                    //   child: Text(
                    //     label,
                    //     maxLines: 2,
                    //     overflow: TextOverflow.ellipsis,
                    // style: TextStyle(
                    //   fontSize: fontSize,
                    //   color: labelColor,
                    // ),
                    //   ),
                    // ),
                  ],
                ),
              );
            });

  static bool isChecked(bool? state) {
    return state != null && state;
  }
}

class CustomCheckboxList extends FormField<List<String>> {
  CustomCheckboxList({
    super.key,
    required void Function(List<String>) onChanged,
    TextStyle? labelStyle,
    FormFieldValidator<List<String>?>? validator,
    List<String>? initialValueList,
    required List<DropdownValueModel> choiceItems,
    double size = 14,
    double fontSize = 12,
    Color labelColor = AppColors.fontGrey,
    Color unselectedBorderColor = AppColors.fontGrey,
    Color selectedBorderColor = AppColors.secondaryColor,
    BorderRadius? borderRadius,
    int crossAxiscount = 5,
    double height = 140,
    ScrollPhysics? physics,
    bool thumbVisibility = false,
    double? mainAxisExtent,
  }) : super(
            onSaved: (v) => onChanged.call(v ?? []),
            initialValue: initialValueList,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            builder: (FormFieldState<List<String>> state) {
              return SizedBox(
                height: height,
                child: Scrollbar(
                  thumbVisibility: thumbVisibility,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: choiceItems.length,
                    physics: physics,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxiscount,
                      mainAxisExtent: mainAxisExtent ?? 200,
                    ),
                    itemBuilder: (context, index) => _buildWidget(
                        state,
                        choiceItems[index].key,
                        size,
                        borderRadius,
                        selectedBorderColor,
                        unselectedBorderColor,
                        choiceItems,
                        index,
                        fontSize,
                        labelColor),
                  ),
                ),
              );
              // return Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: List.generate(
              //     choiceItems.length,
              //     (index) {
              //       String element = choiceItems[index].key;
              //       return _buildWidget(
              //           state,
              //           element,
              //           size,
              //           borderRadius,
              //           selectedBorderColor,
              //           unselectedBorderColor,
              //           choiceItems,
              //           index,
              //           fontSize,
              //           labelColor);
              //     },
              //   ),
              // );
            });

  static GestureDetector _buildWidget(
      FormFieldState<List<String>> state,
      String element,
      double size,
      BorderRadius? borderRadius,
      Color selectedBorderColor,
      Color unselectedBorderColor,
      List<DropdownValueModel> choiceItems,
      int index,
      double fontSize,
      Color labelColor) {
    return GestureDetector(
      onTap: () {
        List<String> data = state.value ?? [];
        if (data.contains(element)) {
          data.remove(element);
          state.didChange(data);
        } else {
          data.add(element);
          state.didChange(data);
        }
        state.save();

        // setState(() {
        //   isChecked = !isChecked;
        // });
        // onChanged.call(isChecked);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: isChecked(state.value ?? [], element)
                      ? selectedBorderColor
                      : unselectedBorderColor,
                  width: 1.2,
                ),
                color: isChecked(state.value ?? [], element)
                    ? selectedBorderColor
                    : null,
              ),
              child: isChecked(state.value ?? [], element)
                  ? Icon(
                      Icons.check,
                      size: size - 4,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                choiceItems[index].value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  color: labelColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static bool isChecked(List<String> state, String key) {
    return state.contains(key);
  }
}
