
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/auth/model/country_model.dart';
part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState{
  const factory EditProfileState({
    required FormStatus status,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNo,
    required String dateOfBirth,
    required String address,
    required String deviceId,
    List<Countries>? countryList,
    Countries? country,
    String? nif,
    String? middleName,


  })=_EditProfileState;

  factory EditProfileState.initial({
    FormStatus status=const FormStatus.initial(),
    String firstName='',
    String email='',
    String lastName='',
    String middleName='',
    String phoneNo='',
    String dateOfBirth='',
    String address='',
    String deviceId=''

})=> EditProfileState(status: status, firstName: firstName, email: email, phoneNo: phoneNo,
      dateOfBirth: dateOfBirth,address: address,deviceId: deviceId, lastName: lastName,middleName: middleName);
}