
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/auth/model/country_model.dart';

import '../../../../core/network/api_base.dart';
part 'signup_state.freezed.dart';

@freezed
 class SignUpState with _$SignUpState{

  const factory SignUpState({
    required FormStatus status,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? phoneNo,
    String? nib,
    String? referredBy,
    String? knowAboutUs,
    String? dob,
    String? password,
    String? key,
    XFile? file,
    Countries? nationality,
    Failure? failure,
    CountryModel? countryModel

})=_SignUpState;

  factory SignUpState.initial({
    FormStatus status= const FormStatus.initial(),
     String? knowAboutUs="Self"

})=>SignUpState(status: status,knowAboutUs: knowAboutUs);

}