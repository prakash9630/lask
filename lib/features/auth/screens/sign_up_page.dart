import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/components/custom_card_field.dart';
import 'package:lask_client/components/custom_dropdown_search.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import 'package:lask_client/features/auth/model/country_model.dart';
import 'package:lask_client/features/auth/provider/signup_provider/signup_notifier.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/utils/validators.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';
import '../../../core/consts/colors.dart';
import '../../../util/date_format.dart';
import '../../../widgets/add_card_dialog.dart';
import '../../../widgets/profile_image_change_dialog.dart';
import '../widgets/refrence_btn.dart';
import 'dart:io';

final signUpStateProvider = StateProvider<int>((ref) {
  return 0;
});

@RoutePage()
class SignUpPage extends HookConsumerWidget {
   SignUpPage({Key? key}) : super(key: key);
  final List<String> referredBy=[
    "Self",
    "Referred by Someone"
  ];

  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  int flag=0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selectedIndex= useState<int>(0);
    final stripeToken = useState<String?>(null);

    useEffect(() {
       if(flag==0){
         ref.read(signupNotifyProvider.notifier).onFetchCountry();
        flag=1;
       }
       return null;
     });
    final signUpProv= ref.read(signupNotifyProvider.notifier);
     final singUpState= ref.watch(signupNotifyProvider);

    ref.listen(signupNotifyProvider, (previous, next) {
      next.status.maybeWhen(orElse: (){},success: (){
         showToast(text: "User Created Successfully");
        context.router.popUntilRouteWithName(LoginRoute.name);   // <---- Should do
      },error: (){
        showErrorToast(text: "User could not be registered");
      });
    });

    return WillPopScope(
      onWillPop: () async {
        ref.read(signUpStateProvider.notifier).update((state) => 0);
        return true;
      },
      child: CustomPageHolder(
        title: 'Sign Up',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 10),
                    child: textW600S18(label: "Provide your details"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: textW400S14(
                        label: "Enter your details to complete the registration",
                        color: AppColors.lightGreyColor),
                  ),
                  textFieldPadding(
                    bottomPadding: 25,
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          profileImageChangeDialog(context,isSignUp: true,
                          onImagePick:signUpProv.onSetFile);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: singUpState.file!=null? ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: ClipOval(
                                  child: Image.file(
                                    File(singUpState.file!.path),
                                    fit: BoxFit.cover,
                                    height: 130,
                                    width: 130,
                                  ),
                                ),
                              ):ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  color: AppColors.primaryColor,
                                  padding: const EdgeInsets.all(25),
                                  child: SvgPicture.asset(AssetPath.userIcon,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            textW500S15(label: "Upload Image")
                          ],
                        ),
                      ),
                    ),
                  ),
                  textFieldPadding(
                      child:  CustomTextField(
                    labelText: "First Name",
                    hintText: "Enter your first name",
                    onChanged: signUpProv.onFirstNameChange ,
                        validator: Validators.isRequired,
                        showRequired: true,
                  )),
                  textFieldPadding(
                      child:  CustomTextField(
                        labelText: "Middle Name",
                        hintText: "Enter your middle name",
                        onChanged: signUpProv.onMiddleNameChange,
                      )),
                  textFieldPadding(
                      child:  CustomTextField(
                        labelText: "Last Name",
                        hintText: "Enter your last name",
                        onChanged: signUpProv.onLastNameChange ,
                        validator: Validators.isRequired,
                        showRequired: true,
                      )),
                  textFieldPadding(
                      child:  CustomPhoneField(
                    labelText: "Phone Number",
                        validator: Validators.isRequired,
                        onChanged:(phone){
                          signUpProv.onPhoneNoChange(phone.phoneNumber);
                        }  ,
                        initialValue: PhoneNumber(isoCode: "NP"),
                    hintText: "Enter your phone no.",
                    showRequired: true,
                  )),
                  textFieldPadding(
                    child: Row(children: [
                      Expanded(child: CustomDatetimePicker(labelText: "Date of Birth ",
                        validator: Validators.dateTime,
                        onDatePicked: (date){
                          signUpProv.onDobChange(dateToString(date!));
                      }, hintText: "eg.03-31-2000",showRequired: true,

                      )),
                      const SizedBox(width: 16,),
                       Expanded(
                         child: CustomDropDownSearch<Countries>(
                           items: singUpState.countryModel?.countries,
                             showSearchBox: true,
                              selectedItem: singUpState.nationality,
                              itemAsString: (item)=> item.name!,
                             validate: true,
                             labelText: "Nationality",
                         onChanged: signUpProv.onNationalityChanged,
                         hintText: "Nationality",
                         ),
                       )
                    ],),
                  ),
                  textFieldPadding(
                      child:  CustomTextField(
                        labelText: "NIF",
                        hintText: "Enter your NIF",
                        onChanged: signUpProv.onNibChange,
                        validator: Validators.isRequired,
                        showRequired: true,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: RichText(
                      text: const TextSpan(
                        text: "How did you know about us?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color:AppColors.fontGrey,
                          fontFamily: "Inter",
                        ),
                        children: [
                            TextSpan(
                              text: " *",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: AppColors.red,
                                fontFamily: "Inter",
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  textFieldPadding(
                    child: SizedBox(
                      height: 40,
                      child: ListView.separated(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return GestureDetector(
                                onTap: (){
                                  selectedIndex.value=index;
                                  signUpProv.onKnowAboutUsChange(referredBy[index]);

                                },
                                child: ReferredBtn(label: referredBy[index], isSelected: selectedIndex.value==index,));
                          },
                          separatorBuilder: (context,index){
                            return const Padding(padding: EdgeInsets.only(right: 10));
                          }, itemCount: referredBy.length),
                    ),
                  ),


                  textFieldPadding(child: CustomTextField(labelText: "Referred Person Email",
                  showRequired: true,
                  validator: Validators.email,
                    onChanged: signUpProv.onReferredByChanged,
                  hintText: "louis.fernandez@gmail.com",)),

                  textFieldPadding(
                    child: CustomTextField(
                      labelText: l10n.password,
                      validator: Validators.password,
                      isPassword: true,
                      hintText: "password",
                      onChanged: signUpProv.onPasswordChange,
                      showRequired: true,
                    ),
                  ),

                  textFieldPadding(
                    bottomPadding: 40,
                    child: CustomCardField(labelText: "Enter Card Details",
                        showRequired:true,
                        isCompleted: stripeToken.value!=null,
                        hintText: stripeToken.value==null?"Enter Card Details":"Card Added Successfully",
                        onTap:(){
                          showCardDialog(context, onCardSave: (token) {
                            stripeToken.value=token;
                          });

                    }),
                  ),
                  textFieldPadding(
                    bottomPadding: 26,
                    child: CustomButton(onPressed: (){
                      if(_key.currentState!.validate()){
                        if(singUpState.file!=null){
                           if(stripeToken.value!=null){
                             ref.read(signupNotifyProvider.notifier).signUp(stripeToken.value!);
                           }else{
                             showToast(text: "Please add Card detail");
                           }
                        }else{
                          showErrorToast(text: "Please upload your profile picture");
                        }
                      }
                    }, label: "Complete Signup"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
