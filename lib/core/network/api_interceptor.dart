import 'package:dio/dio.dart';
import 'package:lask_client/core/storage/shared_preferences.dart';
import 'package:lask_client/features/auth/repo/auth_repo.dart';
import '../../helper/utils/secure_storage.dart';

import '../storage/shared_constants.dart';

class ApiInterceptor extends Interceptor {
  final Dio? dioInstance;

  ApiInterceptor({required this.dioInstance});

  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    String? accessToken = await SecureStorage.getData(SharedConstants.access);
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers.putIfAbsent("Authorization", () => "Bearer $accessToken");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode==401 && err.response?.data["code"] == "token_not_valid" &&
        err.response?.data["messages"] != null) {
      try {
        AuthRepo.refreshToken().then((value) async {
          if (value) {
            var newHeader = {
              'Authorization':
              "Bearer ${await SecureStorage.getData(SharedConstants.access)}"
            };
            final opts = Options(
              method: err.requestOptions.method,
              headers: newHeader,
            );
            try {
              final cloneReq = await dioInstance?.request(
                err.requestOptions.path,
                options: opts,
                data: err.requestOptions.data,
                queryParameters: err.requestOptions.queryParameters,
              );
              return handler.resolve(cloneReq!);
            } on DioError catch (e) {
              return handler.next(e);
            }
          } else {
            err.response?.data = 'log_out';
            return handler.reject(err);
          }
        });
      } on DioError catch (e) {
        return handler.next(e);
      }
    } else if ((err.response?.data["code"] == "token_not_valid" &&
        err.response?.data["messages"] == null)) {
       clearData();
       return handler.reject(err);
    } else {
      return handler.reject(err);
    }
  }
}