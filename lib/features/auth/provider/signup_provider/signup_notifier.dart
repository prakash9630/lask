import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/auth/model/country_model.dart';
import 'package:lask_client/features/auth/provider/signup_provider/signup_state.dart';
import '../../repo/auth_repo.dart';

final signupNotifyProvider =
    StateNotifierProvider<SignupNotifier, SignUpState>((ref) {
  return SignupNotifier(ref);
});

class SignupNotifier extends StateNotifier<SignUpState> {
  SignupNotifier(this.ref) : super(SignUpState.initial());
  final Ref ref;

  void onFirstNameChange(String? name) {
    state = state.copyWith(firstName: name,status: const FormStatus.initial());
  }
  void onMiddleNameChange(String? middleName) {
    state = state.copyWith(middleName: middleName,status: const FormStatus.initial());
  }
  void onLastNameChange(String? lastName) {
    state = state.copyWith(lastName: lastName,status: const FormStatus.initial());
  }
  void onSetFile(XFile? file) {
    state = state.copyWith(file: file,status: const FormStatus.initial());
  }

  void onEmailChange(String? email) {
    state = state.copyWith(email: email,status: const FormStatus.initial());
  }
  void onKeyChange(String? key) {
    state = state.copyWith(key: key,status: const FormStatus.initial());
  }

  void onNibChange(String? nib) {
    state = state.copyWith(nib: nib,status: const FormStatus.initial());
  }

  void onPhoneNoChange(String? phoneNo) {
    state = state.copyWith(phoneNo: phoneNo,status: const FormStatus.initial());
  }

  void onDobChange(String? dob) {
    state = state.copyWith(dob: dob,status: const FormStatus.initial());
  }

  void onPasswordChange(String? password){
    state=state.copyWith(password: password,status: const FormStatus.initial());
  }

  void onKnowAboutUsChange(String? knowAboutUs){
    state=state.copyWith(knowAboutUs: knowAboutUs,status: const FormStatus.initial());
  }

  void onReferredByChanged(String? referredBy){
    state=state.copyWith(referredBy: referredBy,status: const FormStatus.initial());
  }
  void onNationalityChanged(Countries? country){
    state=state.copyWith(nationality: country,status: const FormStatus.initial());
  }

  Future<void> onFetchCountry() async {
    final response=await ref.read(authRepo).getCountry();
    state=response.fold((l) => state.copyWith(failure: l), (r){
      var countryModel= CountryModel.fromJson(r);
      return state.copyWith(countryModel: countryModel);
    });

  }

  void signUp(String stripeToken) async{
    var body={
      "first_name":state.firstName,
      "middle_name":state.middleName,
      "last_name":state.lastName,
      "email":state.email,
      "phone_number":state.phoneNo,
      "nib":state.nib,
      "how_did_you_know_about_us":state.knowAboutUs,
      "referred_by":state.referredBy,
      "dob":state.dob,
      "country_id":state.nationality?.id,
      "password":state.password,
      "key":state.key,
      "card_token":stripeToken,
      "user_image": await MultipartFile.fromFile(state.file!.path,
          filename: state.firstName)
    };
    final response =await ref.read(authRepo).signUp(body: body);

    state = response.fold(
            (l) => state.copyWith(status: const FormStatus.error(),failure: l),
            (r) => state.copyWith(status: const FormStatus.success()));
  }
}
