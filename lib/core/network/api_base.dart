import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../helper/utils/app_utils.dart';
import '../../helper/utils/bot_toast.dart';

class Failure {
  int statusCode;
  String message;
  dynamic errorData;

  Failure({
    required this.statusCode,
    required this.message,
    required this.errorData,
  });
}

Future<Either<Failure, dynamic>> apiBase<T>(
  Future<Response<dynamic>> apiCall, {
      bool showProgressDialogue=false,
      bool showToastMsg=false,
  bool isToParseWithModel = false,
}) async {

  List<int> validStatusCode = const [200, 201];
  if(showProgressDialogue) loading();

  try {
     Response? response = await apiCall;
    if (validStatusCode.contains(response.statusCode)) {
      try {
        if(showProgressDialogue) loading(visible: false);
        return Right(response.data);
      } catch (e) {
        if(showProgressDialogue) loading(visible: false);
        return Left(Failure(
          statusCode: response.statusCode!,
          message: 'Parsing Error',
          errorData: response.data,
        ));
      }
    }
    return Left(Failure(
      statusCode: response.statusCode ?? 100,
      message: 'Something went wrong',
      errorData: response.data,
    ));
  } on DioError catch (err) {
    if(showProgressDialogue) loading(visible: false);
    if (kDebugMode) {
      print(':::Dio Error Type: ${err.type}:::');
      print(':::Dio Error Message: ${err.message}:::');
      print(':::Dio Error: ${err.error}:::');
      print(':::Dio Error Response: ${err.response}:::');
    }
    Response? dioResponse = err.response;
    String? errorMsg;
    if (dioResponse != null && dioResponse.data != null) {
      try {
        Map<String, dynamic> data = dioResponse.data;
        if (data.containsKey('detail')) {
          errorMsg = data['detail'];
        }
      } catch (e) {
        //error response data is in string or any other format
        errorMsg = null;
      }
     // if(showProgressDialogue) progressDialogue(visibility: false);

    }

    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        String message = 'The connection has timed out, please try again.';
        showErrorToast(text:  errorMsg ?? message,);
        return Left(
          Failure(
            statusCode: err.response!.statusCode ?? 100,
            message: errorMsg ?? message,
            errorData: err.response!.data,
          ),
        );
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            String message = 'Invalid request';
            // _handle400Error(err, errorMsg ?? message);
            showErrorToast(text:errorMsg ?? message,);
            return Left(
              Failure(
                statusCode: 400,
                message: errorMsg ?? message,
                errorData: err.response!.data,
              ),
            );

          case 401:
            String message = 'Access denied (Unauthorized)';
            showErrorToast(text:errorMsg ?? message);
            // appClear();
            return Left(
              Failure(
                statusCode: 401,
                message: errorMsg ?? message,
                errorData: err.response!.data,
              ),
            );
          case 403:
            String message = 'Access denied (Unauthorized)';
            showErrorToast(text:errorMsg ?? message);
            appClear();
            return Left(
              Failure(
                statusCode: 403,
                message: errorMsg ?? message,
                errorData: err.response!.data,
              ),
            );

          case 404:
            String message = 'The requested information could not be found';
            showErrorToast(text:errorMsg ?? message);
            appClear();
            return Left(
              Failure(
                statusCode: 404,
                message: errorMsg ?? message,
                errorData: err.response!.data,
              ),
            );

          case 409:
            String message = 'Conflict occurred';
            showErrorToast(text:errorMsg ?? message);
            appClear();
            return Left(
              Failure(
                statusCode: 422,
                message: message,
                errorData: err.response!.data,
              ),
            );

          case 500:
            String message =
                'Unknown (Internal) error occurred, please try again later.';
            showErrorToast(
              text:errorMsg ?? message,
            );
            return Left(
              Failure(
                statusCode: 500,
                message: errorMsg ?? message,
                errorData: err.response!.data,
              ),
            );
          case 302:
          default:
            String message = 'Something went wrong, please try again.';
            showErrorToast(
              text:errorMsg ?? message,
            );
            return Left(
              Failure(
                statusCode: 302,
                message: errorMsg ?? 'Something went wrong, please try again',
                errorData: err.response!.data,
              ),
            );
        }
      case DioErrorType.cancel:
        return Left(
          Failure(
            statusCode: 100,
            message: errorMsg ?? 'Something went wrong, please try again',
            errorData: err.response!.data,
          ),
        );

      case DioErrorType.unknown:
        String message = 'No internet connection detected, please try again.';
        if(showToastMsg) {
          showErrorToast(
          text:errorMsg ?? message,
        );
        }
        return Left(
          Failure(
            statusCode: 100,
            message: errorMsg ?? message,
            errorData: err.response?.data,
          ),
        );
      case DioErrorType.badCertificate:
        String message = 'Bad certificate';
        if(showToastMsg) {
          showErrorToast(
            text:errorMsg ?? message,
          );
        }
        return Left(
          Failure(
            statusCode: 100,
            message: errorMsg ?? message,
            errorData: err.response?.data,
          ),
        );
      case DioErrorType.connectionError:
        String message = 'Connection error, please try again.';
        if(showToastMsg) {
          showErrorToast(
            text:errorMsg ?? message,
          );
        }
        return Left(
          Failure(
            statusCode: 100,
            message: errorMsg ?? message,
            errorData: err.response?.data,
          ),
        );
    }
  }
  catch (e) {
    String message = 'Something went wrong, please try again.';
    if(showToastMsg)showErrorToast(text:e.toString()??message);
    return Left(
      Failure(
        statusCode: 100,
        message: message,
        errorData: e,
      ),
    );
  }
}
