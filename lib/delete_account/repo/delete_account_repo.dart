
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

final deleteAccountRepoProvider = Provider<DeleteAccountRepo>((ref) =>DeleteAccountRepo());
class DeleteAccountRepo{
  static const String deleteAccountApi='user/account/delete/';
  final ApiManager _api=getIt<ApiManager>();
  EitherResponse<dynamic> deleteAccount(Map<String,dynamic> map){
    return apiBase(_api.dio!.post(deleteAccountApi,data: map),showProgressDialogue: true);
  }
}