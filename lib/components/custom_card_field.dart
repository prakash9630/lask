import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import '../core/consts/asset_path.dart';
import '../core/consts/colors.dart';


class CustomCardField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final bool showRequired;
  final void Function() onTap;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Color? titleColor;
  final bool? isCompleted;

  const CustomCardField({
    Key? key,
    required this.labelText,
    required this.onTap,
    this.hintText,
    this.showRequired = false,
    this.isCompleted=false, this.contentPadding,
    this.hintStyle, this.textAlign,
    this.titleColor,
  }) : super(key: key);

  @override
  State<CustomCardField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomCardField> {

  @override
  Widget build(BuildContext context) {
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
        GestureDetector(
          onTap:widget.onTap ,
          child: Container(
             height: 50,
             padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:widget.isCompleted==false?AppColors.primaryColor:AppColors.greenColor,width: 2)
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9.0),
                  child: textW500S14(label: widget.hintText??"",color: widget.isCompleted==false?AppColors.primaryColor:AppColors.greenColor),
                ),
                if(widget.isCompleted==true)
                SvgPicture.asset(AssetPath.checkIcon),
                const Spacer(),
                SvgPicture.asset(AssetPath.arrowRight,height: 20,width: 20,
                color: widget.isCompleted==false?AppColors.primaryColor:AppColors.greenColor,)
              ],
            ),

          ),
        )
        // TextFormField(
        //   textAlign: widget.textAlign ?? TextAlign.start,
        //   initialValue: widget.initialValue,
        //   readOnly: true,
        //   controller: widget.controller,
        //   validator: widget.validator,
        //   cursorColor: AppColors.primaryColor,
        //   onTap: widget.onTap,
        //   onChanged: widget.onChanged,
        //   textInputAction: widget.textInputAction ?? TextInputAction.next,
        //
        //   decoration: InputDecoration(
        //     suffixIconConstraints:
        //         const BoxConstraints(
        //             minHeight: 20,
        //         minWidth: 20),
        //     prefixStyle:
        //         const TextStyle(color: AppColors.primaryColor, fontSize: 16),
        //     errorMaxLines: 2,
        //     border: outlineInputBorder,
        //     enabledBorder: outlineInputBorder,
        //     focusedBorder: outlineInputBorder,
        //     errorBorder: outlineInputBorder.copyWith(
        //       borderSide: const BorderSide(color: Colors.red),
        //     ),
        //     disabledBorder: outlineInputBorder,
        //     hintText: widget.hintText,
        //     hintStyle: widget.hintStyle ??
        //         const TextStyle(
        //             color: AppColors.primaryColor,
        //             fontSize: 14.0,
        //             fontWeight: FontWeight.w500),
        //     suffixIcon: Padding(
        //       padding: const EdgeInsets.only(right: 15),
        //       child: SvgPicture.asset(AssetPath.arrowRight,height: 20,width: 20,),
        //     ),
        //
        //     contentPadding: widget.contentPadding ??
        //         const EdgeInsets.symmetric(
        //           horizontal: 16.0,
        //           vertical: 12.0,
        //         ),
        //   ),
        // ),
      ],
    );
  }
}
