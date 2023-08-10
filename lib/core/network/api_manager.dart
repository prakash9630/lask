import 'package:dio/dio.dart';
import 'package:lask_client/core/consts/endpoints.dart';
import 'api_interceptor.dart';

class ApiManager {
  final int _connectionTimeOut = 15000;
  final int _receivedTimeout = 20000;
  Dio? dio;

  ApiManager() {
    BaseOptions options = BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: Duration(milliseconds: _connectionTimeOut),
        receiveTimeout: Duration(milliseconds: _receivedTimeout),
        headers: <String, dynamic>{
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        contentType: Headers.jsonContentType);
    dio = Dio(options);
    dio!.interceptors.add(ApiInterceptor(dioInstance: dio));
  }
}
