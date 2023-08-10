
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/contact_us/provider/contact_us_notifier.dart';
import 'package:lask_client/features/contact_us/widget/purpose_dialuge.dart';
import 'package:lask_client/features/profile/model/profile_model.dart';
import 'package:lask_client/features/profile/provider/profile_provider.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/utils/validators.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import '../../../helper/utils/app_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/custom_image_list_form_field.dart';

class ContactUsForm extends ConsumerWidget {
   ContactUsForm({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final contactNotifyProv= ref.watch(contactUsNotifyProvider.notifier);
    ProfileModel? profile= ref.watch(profileProvider).model;
    ref.listen(contactUsNotifyProvider, (previous, next) {
      next.status.maybeWhen(orElse:(){},success: (){
        showToast(text: "Message Send Successfully");
      });
    });
    return Form(
      key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: CustomTextField(labelText: "Name",
              hintText: "Full name",
              initialValue: profile?.fullName,
               readOnly: true,
              showRequired: true,
               onChanged: contactNotifyProv.onNameChange,
              validator: Validators.name,),
            ),
             Padding(
              padding:  EdgeInsets.only(bottom: 15.h),
              child: CustomTextField(labelText: "Email",
                hintText: "Email address",
                initialValue: profile?.email,
                readOnly: true,
                onChanged: contactNotifyProv.onEmailChange,
                showRequired: true,
                validator: Validators.email,),
            ),
             Padding(
              padding:  EdgeInsets.only(bottom: 15.h),
              child: CustomTextField(labelText: "Phone Number",
                hintText: "Phone Number",
                showRequired: true,
                readOnly: true,
                initialValue: profile?.phoneNumber,
                onChanged: contactNotifyProv.onPhoneChange,
                validator: Validators.name,),
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 15.h),
              child: CustomTextField(labelText: "Purpose",
                hintText: "Choose Service",
                showRequired: true,
                sufixIconSize: 20.r,
                controller: contactNotifyProv.subjectController,
                onChanged: contactNotifyProv.onSubjectChange,
                readOnly: true,
                onTap: (){
                  showPurposeDialogue(context, onChoose: (v) {
                    contactNotifyProv.onSubjectChange(v);
                  });
                },
                suffixIcon:  Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: const Iconify(MaterialSymbols.keyboard_arrow_down_rounded,color: AppColors.fontGrey,),
                ),
                validator: Validators.name,),
            ),
             Padding(
              padding:  EdgeInsets.only(bottom: 15.h),
              child: CustomTextField(labelText: "How can we help you?",
                hintText: "Write your message here",
                showRequired: true,
                onChanged: contactNotifyProv.onMessageChange,
                maxLines:4 ,
                validator: Validators.name,),
            ),

             SizedBox(height: 15.h,),
            CustomImageListFormField(
              labelText: "Attachments",
              imageLength: 10,
              isFile: true,
              imagePick: (v) {
                contactNotifyProv.onFileAdd([...v]);
              },
            ),
            SizedBox(height: 15.h,),

            RichText(
              text: TextSpan(
                text:'For urgent call : ',
                style: DefaultTextStyle.of(context).style,
                children:  <TextSpan>[
                  TextSpan(text: '9800000000',style: const TextStyle(color: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap=(){
                          launchPhone('9800000000');
                        }
                  ),

                ],
              ),
            ),
            SizedBox(height: 30.h,),

            CustomButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                contactNotifyProv.sendMessage(_formKey);
                FocusScope.of(context).unfocus();
              }
            }, label: "Send Message"),
             SizedBox(height: 30.h,),
          ],
        ));
  }
}
