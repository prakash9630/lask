
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

final callRepoProvider = Provider<CallRepo>((ref) => CallRepo());

class CallRepo{
  final ApiManager _api= getIt<ApiManager>();
  // static const String callApi='call/request/create/';
  static const String callApi='call/call-request/create/';
  static const String callRandomApi='random/call/request/create/';
  static const String callLogApi='client/call/log/create/';
  static const String callEndApi='client/call/{id}/end/';
  static const String getCallIdApi="call/client/getid/";
  // static const String rechargeApi="call/recharge/";
  static const String rechargeApi="call/call-recharge/";
  static const String  randomCallApi="random/call/request/create/";
  static String cdnUpload = "https://cdn.asparksys.com/medias/upload/";
  static String verifyPaymentOnMiddleOfCallApi = "finance/call/payment_success/";



  EitherResponse<dynamic> makeCall({required Map<String,dynamic> map}){
    return apiBase(_api.dio!.post(callApi,data: map));
  }

  EitherResponse<dynamic> makeRandomCall({required Map<String,dynamic> map}){
    return apiBase(_api.dio!.post(callRandomApi,data: map));
  }

  EitherResponse<dynamic> callLogCreate({required Map<String,dynamic> map}){
    return apiBase(_api.dio!.post(callLogApi,data: map));
  }

  EitherResponse<dynamic> callEnd({required Map<String,dynamic> map,required String id}){
    return apiBase(_api.dio!.post(callEndApi.replaceAll("{id}", id),data: map),showProgressDialogue: true);
  }

  EitherResponse<dynamic> getCallId({required Map<String,dynamic> map}){
    return apiBase(_api.dio!.post(getCallIdApi,data: map));
  }

  EitherResponse<dynamic> recharge({required Map<String,dynamic> map}){
    return apiBase(_api.dio!.post(rechargeApi,data: map),showProgressDialogue: true);
  }

  EitherResponse<dynamic> callVerify({required String chargeId}){
    return apiBase(_api.dio!.post(verifyPaymentOnMiddleOfCallApi,data: {"charge_id":chargeId}));
  }




  Future<Map<String, dynamic>?> postImage({required File file}) async {
    var data = {
      'file': await MultipartFile.fromFile(file.path),
    };
    final response= await apiBase(_api.dio!.post(cdnUpload,data: FormData.fromMap(data)));
    return response.fold((l) => null, (r) {
      return r;
    });
  }
}