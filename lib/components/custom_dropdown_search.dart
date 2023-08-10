import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../core/consts/colors.dart';


class CustomDropDownSearch<T> extends StatelessWidget {
  final List<T>? items;
  final Mode mode;
  final T? selectedItem;
  final String labelText;
  final String? hintText;

  final String Function(T)? itemAsString;
  final Color? dropDownColor;
  final bool validate;
  final String Function(T)? onValidate;
  final bool showSearchBox;
  final bool? enable;
  final PopupProps? popupProps;
  final void Function(T?)? onChanged;

  const CustomDropDownSearch({super.key,
    required this.items,
    this.mode = Mode.DIALOG,
    this.validate = true,
    this.hintText,
    this.popupProps,
    this.onValidate,
    this.enable=true,
    this.showSearchBox = false,
    this.selectedItem,
    this.itemAsString,
    this.dropDownColor,
    this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty) ...[
          Text(labelText,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.greyColor)),
          const SizedBox(
            height: 5,
          )
        ],
        DropdownSearch<T>(
          enabled: enable!,

          dropdownButtonProps: const DropdownButtonProps(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.greyColor,
            ),
          ),
          validator: (v){
            if(validate && v==null){
              return "Required";
            }else if(onValidate!=null){
              return onValidate!(v as T);
            }else{
              return null;
            }
          },
          popupProps: PopupProps.menu(
            // showSelectedItems: true,
              fit: FlexFit.loose,
              searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.borderColor)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.borderColor)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.borderColor)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.borderColor)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red)
                      ),
                      hintText: "Search $labelText",
                      hintStyle: const TextStyle(color: AppColors.hintTextColor,fontSize: 13),
                      constraints: const BoxConstraints(
                          maxHeight: 50
                      )
                  )
              ),
              showSearchBox: showSearchBox
          ),
          items: items??[],
          itemAsString: itemAsString,
          dropdownDecoratorProps:  DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.borderColor)
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.borderColor)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.borderColor)
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.borderColor)
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.red)
              ),
              focusColor: AppColors.lightGreyColor,
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.hintTextColor,fontSize: 13),
              // constraints: const BoxConstraints(
              //   maxHeight: 60
              // ),
            ),
          ),
          onChanged: onChanged,
          selectedItem: selectedItem,
        ),
      ],
    );

  }
}
