

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/core/storage/shared_constants.dart';
import 'package:lask_client/features/auth/provider/login_provider/login_state.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../repo/auth_repo.dart';

final loginProvider = StateNotifierProvider.autoDispose<LoginNotifier,LoginState>((ref) {
return LoginNotifier(ref);
});


class LoginNotifier extends StateNotifier<LoginState>{
  LoginNotifier(this.ref):super(LoginState.initial());
  final Ref ref;

  void onUserNameChanged(String userName){
    state=state.copyWith(username: userName,status:const FormStatus.initial());
  }
  void onPassWordChanged(String pass){
    state=state.copyWith(password: pass,status:const FormStatus.initial());
  }
  void initData(Map<String, dynamic> data, bool isRemember) {
    state=state.copyWith(
      username: data['userName'],
      password: data['password'].isNotEmpty,
      status: const FormStatus.initial()
    );
  }
  void login() async{
    Map<String,dynamic> body={
      "username":state.username,
      "password":state.password
    };
    final response =await ref.read(authRepo).login(body: body);
    state= response.fold((l){
      return state.copyWith(status: const FormStatus.error(),
          failure: l);
    }, (r){
      SecureStorage.setData(
        SharedConstants.access,r['access'],);
      SecureStorage.setData(
        SharedConstants.refresh,r['refresh'],
      );
      return state.copyWith(status:const FormStatus.success());
    });

  }
}