
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:dio/dio.dart';
import '../../../core/services/service_locator.dart';

final editProfileRepoProvider = Provider<EditProfileRepo>((ref)=>EditProfileRepo());

class EditProfileRepo {
  final ApiManager _api = getIt<ApiManager>();
  static const String userProfileUpdateAp = 'client/profile-update-request/';

  Future<Either<Failure, dynamic>> updateUserProfileRequest(
      {required Map<String, dynamic> data}) async {
    FormData formData = FormData.fromMap(data);

    return apiBase(_api.dio!.post(userProfileUpdateAp, data: formData),
        showProgressDialogue: true, showToastMsg: true);
  }
}
