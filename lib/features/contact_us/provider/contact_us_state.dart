
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'dart:io';
part 'contact_us_state.freezed.dart';

@freezed
abstract class ContactUsState with _$ContactUsState{
  const factory ContactUsState({
    required FormStatus status,
    Failure? failure,
    String? fullName,
    String? email,
    List<File>? files,
    String? phoneNo,
    String? subject,
    String? message,

  })=_ContactUsState;

  factory ContactUsState.initial({
    FormStatus status =const FormStatus.initial(),
})=>ContactUsState(status: status);

}