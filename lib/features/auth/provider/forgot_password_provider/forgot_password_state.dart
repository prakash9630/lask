
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/features/auth/model/forgot_password_model.dart';
part 'forgot_password_state.freezed.dart';
@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState{
  const factory ForgotPasswordState({
    required FormStatus status,
    required String email,
    ForgotPassModel? model,
    Failure? failure
})= _ForgotPasswordState;

  factory ForgotPasswordState.initial({
    FormStatus status=const FormStatus.initial(),
    String email=''
})=> ForgotPasswordState(status: status, email: email);
}