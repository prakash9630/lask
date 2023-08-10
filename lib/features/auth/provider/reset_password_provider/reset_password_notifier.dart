import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/auth/provider/reset_password_provider/reset_password_state.dart';
import 'package:lask_client/features/auth/repo/auth_repo.dart';

import '../../../../core/enums/data_status.dart';

final resetPassProvider = StateNotifierProvider<ResetPasswordNotifier,ResetPasswordState >((ref) {
  return ResetPasswordNotifier(ref);
});

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState>{
  ResetPasswordNotifier(this.ref):super(ResetPasswordState.initial());
  final Ref ref;
  void onOldPassChange(String oldPass){
    state = state.copyWith(oldPassword: oldPass,status: DataStatus.initial);
  }

  void onNewPassChange(String newPass){
    state=state.copyWith(newPassword: newPass,status: DataStatus.initial);
  }

  void onPasswordReset(Map<String,dynamic>body)async{
    final response= await ref.read(authRepo).resetPassword(body:body);
    state= response.fold((l) => state.copyWith(failure: l,status: DataStatus.error),
            (r) => state.copyWith(status: DataStatus.success));

  }
  void onPasswordUpdate()async{
    final response= await ref.read(authRepo).updatePassword(body:{
      "old_password": state.oldPassword,
      "new_password": state.newPassword
    });
    state= response.fold((l) => state.copyWith(failure: l,status: DataStatus.error),
            (r) => state.copyWith(status: DataStatus.success));
  }
}
