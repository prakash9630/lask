
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/network/api_base.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState{
  const factory LoginState({
    required FormStatus status,
    required String username,
     Failure? failure,
    required String password,
})=_LoginState;

  factory LoginState.initial({
    String user='',
    String pass='',
    FormStatus status=const FormStatus.initial()
})=> LoginState(
      username: user,
      password: pass,
      status: status);
}