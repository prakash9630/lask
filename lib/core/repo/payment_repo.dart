
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

final paymentRepoProvider = Provider<PaymentRepo>((ref) =>PaymentRepo());
class PaymentRepo{
  final ApiManager _api= getIt<ApiManager>();
  static const String createPaymentApi="finance/create/payment/";
  static const String  passIntentApi ="/finance/create/payment/intent/";
  static const String paymentVerificationApi ="finance/call/payment/verification/";
  static const String rechargeVerificationApi ="finance/call/recharge/verification/";




  EitherResponse<dynamic> createWithTariffIdPayment(int tariffsId){
    return apiBase(_api.dio!.post(createPaymentApi,data: {
      "tariff_id":tariffsId
    }),showProgressDialogue: true,showToastMsg: true);
  }

  EitherResponse<dynamic> passIntentData(Map<String,dynamic> map,int orderId){
    return apiBase(_api.dio!.post(passIntentApi,data: {
      "payment_intent":map,
      "order_id":orderId
    })
        ,showProgressDialogue: true,showToastMsg: true);
  }


  /// old one ////
  EitherResponse<dynamic> paymentVerify(String intentId,int orderId){
    return apiBase(_api.dio!.post(paymentVerificationApi,data: {
      "payment_intent_id":intentId,
      "order_id":orderId
    })
        ,showProgressDialogue: true,showToastMsg: true);
  }

  EitherResponse<dynamic> paymentBackendVerify(int callReqId,{bool isRecharge=false}){
    return apiBase(_api.dio!.post(isRecharge?rechargeVerificationApi:paymentVerificationApi,data: {
      "charge_id":callReqId
    }));
  }
}