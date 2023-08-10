
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/environment.dart';
import 'package:lask_client/core/model/product_model.dart';
import 'package:lask_client/core/repo/payment_repo.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';

import '../../calls/model/payment_verify_model.dart';

 Map<String,dynamic>? paymentIntent;
Future<void> makePayment(BuildContext context,{
  required double amount,
  required ProductModel product,
  required Function(String paymentIntentId,PaymentVerifyModel verifyModel) onPaymentSuccess,
  required WidgetRef ref,
  bool? isRecharge=false
}) async {
  try {
    //STEP 1: Create Payment Intent
    paymentIntent = await createPaymentIntent(amount, 'EUR',product);

    final response=await ref.read(paymentRepoProvider).passIntentData(paymentIntent!,product.orderId!);
    response.fold((l) => null, (r) async {

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent![
              'client_secret'], //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Lask_Client'))
          .then((value) {

        //STEP 3: Display Payment sheet
        if(context.mounted){
          displayPaymentSheet(context,onPaymentSuccess:(payment)=>onPaymentSuccess(paymentIntent!["id"],payment),ref: ref,productId: product.orderId!);
        }
      });
    });

  } catch (err) {
    throw Exception(err);
  }
}

createPaymentIntent(double amount, String currency,ProductModel model) async {
  try {
    //Request body
    Dio dio=Dio();
    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': currency,
      'payment_method_types[]':'card',
      'metadata':{
        "order_id": model.orderId
      }
    };

     var response=await dio.post('https://api.stripe.com/v1/payment_intents',
     options: Options(
        headers: {
           'Authorization': 'Bearer ${EnvironmentConfig.stripSecret}',
           'Content-Type': 'application/x-www-form-urlencoded'
         },
     ),
     data: body);
    return response.data;

  } catch (err) {
    throw Exception(err.toString());
  }
}

// Future<void> makePaymentWithToken(String paymentMethodId) async {
//   final paymentSheetParameters = SetupPaymentSheetParameters(
//     paymentIntentClientSecret: 'YOUR_PAYMENT_INTENT_CLIENT_SECRET',
//     style: ThemeMode.light,
//     merchantDisplayName: 'Lask_Client',
//   );
//
//   await Stripe.initPaymentSheet(paymentSheetParameters);
//   await stripe.presentPaymentSheet();
//   await stripe.confirmPaymentSheetPayment();
//
//   print('Payment succeeded!');
// }



displayPaymentSheet(BuildContext context,{required Function(PaymentVerifyModel model) onPaymentSuccess,required WidgetRef ref,required int productId}) async {
  try {
    await Stripe.instance.presentPaymentSheet().then((value) async {
     final response= await ref.read(paymentRepoProvider).paymentVerify(paymentIntent!['id'],productId);
     response.fold((l){
       showErrorToast(text: "Error");
     }, (r) {
       onPaymentSuccess(PaymentVerifyModel.fromJson(r));
       paymentIntent = null;
     });
    })
        .onError((error, stackTrace) {
      throw Exception(error);
    });
  }
  on StripeException catch (e) {
    print('Error is:---> $e');
  }
  catch (e) {
    print('$e');
  }
}

String calculateAmount(double amount) {
  int amountInCents = (amount * 100).toInt();
  return amountInCents.toString();
}

