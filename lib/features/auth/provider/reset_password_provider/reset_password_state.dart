
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lask_client/core/network/api_base.dart';

import '../../../../core/enums/data_status.dart';
part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState{
  const factory ResetPasswordState({
    required DataStatus status,
    required String newPassword,
    String? oldPassword,
    Failure? failure

})=_ResetPasswordState;

  factory ResetPasswordState.initial({
    DataStatus status = DataStatus.initial,
    String newPass='',

})=> ResetPasswordState(status: status,newPassword: newPass);
}