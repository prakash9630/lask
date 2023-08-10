
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/auth/model/country_model.dart';
import 'package:lask_client/features/profile/model/profile_model.dart';
import '../repo/edit_profile_repo.dart';
import 'edit_profile_state.dart';

final editProfileNotifyProvider =
    StateNotifierProvider<EditProfileNotifier, EditProfileState>((ref) {
  return EditProfileNotifier(ref);
});

class EditProfileNotifier extends StateNotifier<EditProfileState> {
  EditProfileNotifier(this.ref) : super(EditProfileState.initial());
  final Ref ref;

  void onFirstNameChange(String firstName) {
    state = state.copyWith(firstName: firstName, status: const FormStatus.initial());
  }
  void onMiddleNameChange(String middleName) {
    state = state.copyWith(middleName: middleName, status: const FormStatus.initial());
  }
  void onLastNameChange(String lastName) {
    state = state.copyWith(lastName: lastName, status: const FormStatus.initial());
  }
  void onEmailChange(String email) {
    state = state.copyWith(email: email, status: const FormStatus.initial());
  }

  void onDobChange(String dob) {
    state =
        state.copyWith(dateOfBirth: dob, status: const FormStatus.initial());
  }

  void onAddressChange(String address) {
    state =
        state.copyWith(address: address, status: const FormStatus.initial());
  }

  void onNationalityChange(Countries country) {
    state = state.copyWith(
        country: country, status: const FormStatus.initial());
  }

  void onPhoneNoChange(String phoneNo) {
    state =
        state.copyWith(phoneNo: phoneNo, status: const FormStatus.initial());
  }

  void setInitialData(ProfileModel? model, String? deviceId) {
    state = state.copyWith(
        status: const FormStatus.initial(),
        firstName: model?.firstName ?? "",
        middleName: model?.middleName??"",
        lastName: model?.lastName??"",
        email: model?.email ?? "",
        dateOfBirth: model?.dob??"",
        phoneNo: model?.phoneNumber ?? "",
        address: model?.address??"",
        deviceId: deviceId ?? "");
  }

   selectedCountry(List<Countries>? country,int id){
    if(country!=null){
      Countries? ctr = country.firstWhere((element) => element.id==id);
        state = state.copyWith(
            country: ctr,countryList: country, status: const FormStatus.initial());
    }}

  Future<void> editProfile() async {
    var data = {
      "first_name": state.firstName,
      "middle_name": state.middleName,
      "last_name": state.lastName,
      "phone_number": state.phoneNo,
      "address": state.address,
      "email":state.email,
      "country_id":state.country?.id,
      "mobile_device_id": state.deviceId,
      "dob":state.dateOfBirth,
    };
    final response =
        await ref.read(editProfileRepoProvider).updateUserProfileRequest(data: data);
    state = response.fold(
        (l) => state.copyWith(status: const FormStatus.error()),
        (r) => state.copyWith(status: const FormStatus.success()));
  }
}
