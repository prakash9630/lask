
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/auth/model/forgot_password_model.dart';
import 'package:lask_client/features/auth/provider/forgot_password_provider/forgot_password_state.dart';
import 'package:lask_client/features/auth/repo/auth_repo.dart';

final forgotPasswordProvider = StateNotifierProvider<ForgotPasswordNotifier,ForgotPasswordState>((ref) {
  return ForgotPasswordNotifier(ref);
});

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState>{
  ForgotPasswordNotifier(this.ref):super(ForgotPasswordState.initial());
  final Ref ref;

  onEmailChange(String email){
   state = state.copyWith(email: email,status: const FormStatus.initial());
  }

 void onForgotPassword()async{
    final response =await ref.read(authRepo).forgotPassword(body: {"email":state.email});
    state= response.fold((l){
        return state.copyWith(status: const FormStatus.error(),failure: l);
    }, (r) {
         return state.copyWith(status: const FormStatus.success(),model: ForgotPassModel.fromJson(r));
    });
  }

}