import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/components/custom_dropdown_search.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/profile/provider/profile_provider.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';
import 'package:lask_client/widgets/custom_page_holder.dart';
import '../../../core/consts/asset_path.dart';
import '../../../helper/utils/validators.dart';
import '../../../util/date_format.dart';
import '../../auth/model/country_model.dart';
import '../../auth/provider/signup_provider/signup_notifier.dart';
import '../provider/edit_profile_notifier.dart';
import '../provider/edit_profile_state.dart';

@RoutePage()
class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  int flag = 0;
  PhoneNumber? phoneNo;
  EditProfileState? editNotifyState;
  EditProfileNotifier? editNotifyProv;
  bool disableField = true;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (flag == 0) {
      phoneNo = ref.read(profileProvider).phoneNumber;
      ref.read(signupNotifyProvider.notifier).onFetchCountry();
      await ref
          .read(signupNotifyProvider.notifier)
          .onFetchCountry()
          .then((value) {
        ref.read(editProfileNotifyProvider.notifier).selectedCountry(
            ref.read(signupNotifyProvider).countryModel?.countries,
            ref.read(profileProvider).model!.country!);
      });
      editNotifyProv = ref.read(editProfileNotifyProvider.notifier);
      editNotifyState = ref.read(editProfileNotifyProvider);

      setState(() {
        flag = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileProv = ref.watch(profileProvider);
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    ref.listen(editProfileNotifyProvider, (previous, next) {
      next.status.maybeWhen(
          orElse: () {},
          success: () {
            showToast(text: "Profile update request send Successfully");
            ref.watch(profileProvider).getData();
            context.router.pop();
          },
          error: () {
            showErrorToast(text: "Could not  update profile");
          });
    });
    return CustomPageHolder(
        title: "View Profile",
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                disableField = !disableField;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                AssetPath.editIcon,
                color: disableField
                    ? AppColors.primaryColor
                    : AppColors.greenColor,
              ),
            ),
          )
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: IgnorePointer(
                ignoring: disableField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 22),
                      child: textW600S18(
                          label: "Edit your details",
                          color: AppColors.black2CColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: textW400S14(
                          label:
                              "Update your details to complete the registration",
                          color: AppColors.lightGreyColor),
                    ),
                    textFieldPadding(
                      child: CustomTextField(
                        labelText: "First Name",
                        hintText: "Enter your full name",
                        // readOnly: profileProv.model?.firstName != null &&
                        //     profileProv.model!.firstName!.isNotEmpty,
                        initialValue: profileProv.model?.firstName,
                        onChanged: editNotifyProv?.onFirstNameChange,
                        showRequired: true,
                      ),
                    ),
                    textFieldPadding(
                      child: CustomTextField(
                        labelText: "Middle Name",
                        hintText: "Enter your middle name",
                        // readOnly: profileProv.model?.firstName != null &&
                        //     profileProv.model!.firstName!.isNotEmpty,
                        initialValue: profileProv.model?.middleName,
                        onChanged: editNotifyProv?.onMiddleNameChange,
                      ),
                    ),
                    textFieldPadding(
                      child: CustomTextField(
                        labelText: "Last Name",
                        hintText: "Enter your last name",
                        // readOnly: profileProv.model?.firstName != null &&
                        //     profileProv.model!.firstName!.isNotEmpty,
                        initialValue: profileProv.model?.lastName,
                        onChanged: editNotifyProv?.onLastNameChange,
                        showRequired: true,
                      ),
                    ),
                    textFieldPadding(
                      child: CustomTextField(
                        labelText: "Email",
                        hintText: "Enter your email",
                        // readOnly: profileProv.model!.email!.isNotEmpty,
                        initialValue: profileProv.model?.email,
                        onChanged: editNotifyProv?.onEmailChange,
                        showRequired: true,
                      ),
                    ),
                    textFieldPadding(
                      child: CustomPhoneField(
                        labelText: "Phone Number",
                        hintText: "Enter your Phone no.",
                        // initialValue: phoneNo,
                        onChanged: (v) {
                          editNotifyProv?.onPhoneNoChange(v.phoneNumber!);
                        },
                        showRequired: true,
                      ),
                    ),
                    textFieldPadding(
                        child: Row(
                      children: [
                        Expanded(
                            child: CustomDatetimePicker(
                          labelText: "Date of Birth ",
                          validator: Validators.dateTime,
                          initialValue: editNotifyState?.dateOfBirth != null
                              ? DateTime.parse(editNotifyState!.dateOfBirth)
                              : null,
                          onDatePicked: (date) {
                            editNotifyProv?.onDobChange(dateToString(date!));
                          },
                          hintText: "eg.03-31-2000",
                          showRequired: true,
                        )),
                        const SizedBox(
                          width: 16,
                        ),
                        // Expanded(
                        // Expanded(
                        //   child: CustomDropDownSearch<Countries>(
                        //     items: singUpState.countryModel?.countries,
                        //     showSearchBox: true,
                        //     selectedItem: singUpState.nationality,
                        //     itemAsString: (item) => item.name!,
                        //     labelText: "Nationality",
                        //     onChanged: (v) {
                        //       editNotifyProv.onNationalityChange(v!);
                        //     },
                        //     hintText: "nationality",
                        //   ),
                        // )
                        Expanded(
                          child: CustomDropDownSearch<Countries>(
                            items: editNotifyState?.countryList,
                            showSearchBox: true,
                            selectedItem: editNotifyState?.country,
                            itemAsString: (item) => item.name!,
                            labelText: "Nationality",
                            onChanged: (v) {
                              editNotifyProv?.onNationalityChange(v!);
                            },
                            hintText: "nationality",
                          ),
                        )
                      ],
                    )),

                    textFieldPadding(
                      child: CustomTextField(
                        labelText: "Address",
                        hintText: "Enter your Address",
                        initialValue: profileProv.model?.address,
                        onChanged: (v) {
                          editNotifyProv?.onAddressChange(v);
                        },
                      ),
                    ),
                    textFieldPadding(
                      child: const CustomTextField(
                        labelText: "NIF (Optional)",
                        // readOnly: true,
                        hintText: "Enter your NIF",
                      ),
                    ),
                    // textFieldPadding(
                    //  bottomPadding: 40,
                    //   child: CustomCardField(labelText: "Add Card",
                    //     hintText: "View Card Detail",
                    //     showRequired: true,
                    //     onTap: (){
                    //       showCardDialog(context);
                    //     },
                    //
                    //   ),
                    // ),
                    const SizedBox(
                      height: 26,
                    ),
                    if (!disableField)
                      textFieldPadding(
                        bottomPadding: 40,
                        child: CustomButton(
                            onPressed: () async {
                              if (key.currentState!.validate()) {
                                editNotifyProv?.editProfile();
                              }
                            },
                            label: "Send Change Request"),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
