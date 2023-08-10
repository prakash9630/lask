import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/storage/shared_constants.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';
import 'package:lask_client/features/auth/repo/iauth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/consts/endpoints.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/storage/secure_storage.dart';

final authRepo = Provider((ref) => AuthRepo());

class AuthRepo implements IAuthRepo {
  static const String loginApi = "token/";
  static const String tokenRefreshApi = "token/refresh/";
  static const String forgotPasswordApi = "forget-password/email/";
  static const String resetPasswordApi = "resetpassword/";
  static const String updatePasswordApi = "user/password/update/";
  static const String emailValidationApi = "registration/email/validate/";
  static const String emailValidationForgotPassApi =
      "forget-password/email/validate/";
  static const String emailRegisterApi = "user/email/register/";
  static const String signUpApi = "client/create/";
  static const String getCountryApi = "country/";


  static final ApiManager _api = getIt<ApiManager>();

  @override
  Future<Either<Failure, dynamic>> login({required Map<String, dynamic> body}) {
    return apiBase(_api.dio!.post(loginApi, data: body),
        showProgressDialogue: true);
  }

  @override
  Future<Either<Failure, dynamic>> forgotPassword(
      {required Map<String, dynamic> body}) {
    return apiBase(
        _api.dio!.post(
          forgotPasswordApi,
          data: body,
        ),
        showProgressDialogue: true);
  }

  @override
  Future<Either<Failure, dynamic>> emailValidation(
      {required Map<String, dynamic> body, required bool isForgotPass}) {
    return apiBase(
        _api.dio!.post(
          isForgotPass ? emailValidationForgotPassApi : emailValidationApi,
          data: body,
        ),
        showProgressDialogue: true);
  }

  static Future<bool> refreshToken() async {
    try {
      Dio dio = Dio();
      var response = await dio.post(Endpoints.baseUrl + tokenRefreshApi, data: {
        "refresh": await SecureStorage.getData(SharedConstants.refresh)
      });

      await SecureStorage.setData(
          SharedConstants.access, response.data['access']);
      return true;
    } catch (e) {
      debugPrint('$e');
    }
    return false;
  }

  @override
  Future<Either<Failure, dynamic>> resetPassword(
      {required Map<String, dynamic> body}) {
    return apiBase(_api.dio!.post(resetPasswordApi, data: body),
        showProgressDialogue: true);
  }

  @override
  Future<Either<Failure, dynamic>> updatePassword(
      {required Map<String, dynamic> body}) {
    return apiBase(_api.dio!.post(updatePasswordApi, data: body));
  }

  @override
  Future<Either<Failure, dynamic>> emailRegister(
      {required Map<String, dynamic> body}) {
    return apiBase(
        _api.dio!.post(
          emailRegisterApi,
          data: body,
        ),
        showProgressDialogue: true);
  }

  @override
  Future<Either<Failure, dynamic>> signUp(
      {required Map<String, dynamic> body}) {
      FormData formData= FormData.fromMap(body);
    return apiBase(_api.dio!.post(signUpApi, data: formData),
        showProgressDialogue: true);
  }

  @override
  EitherResponse getCountry() {
     return apiBase(_api.dio!.get(getCountryApi,queryParameters:{"limit":100}));
  }
}
