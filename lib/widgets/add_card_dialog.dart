
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/helper/utils/bot_toast.dart';
import 'package:lask_client/helper/utils/validators.dart';

void showCardDialog(BuildContext context,{required Function(String token) onCardSave}){
  showModalBottomSheet(
    context: context,
      isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
    ),
    backgroundColor: Colors.white,
    builder: (sheetContext) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: 450,
            child: AddCardDialog(onCardSave: onCardSave,)),
      );
    },
  );
}


class AddCardDialog extends ConsumerStatefulWidget {
  const AddCardDialog({Key? key,required this.onCardSave}) : super(key: key);
  final Function(String token) onCardSave;

  @override
  ConsumerState<AddCardDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<AddCardDialog> {
  final GlobalKey<FormState> _key=GlobalKey<FormState>();
  final cardNoController= TextEditingController();
  final nameController= TextEditingController();
  DateTime? expireDate;
  final cardIdController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23,right: 23,top: 10),
      child: SingleChildScrollView(
        child: Form(
          key:_key,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children:  [
                    const Center(child: Text("Add your card details",style: TextStyle(fontSize:20 ,fontWeight:FontWeight.w600 ,color:AppColors.filterHeaderColor),)),
                    const Spacer(),
                    InkWell(onTap:(){
                      Navigator.pop(context);
                    },child: const Icon(Icons.close,))
                  ],),
              ),
              const SizedBox(height: 25,),

               Padding(
                padding:  const EdgeInsets.only(bottom: 15,top: 25),
                child:  CustomTextField(
                  controller: nameController,
                  labelText: "Name on Card",
                  hintText: "e.g. Joseph Macariena",
                  validator: Validators.isRequired,
                  showRequired: true,),
              ),

               Padding(
                padding:  const EdgeInsets.only(bottom: 15),
                child:  CustomTextField(labelText: "Card Number",
                  length: 16,
                  controller: cardNoController,
                  keyboardType: TextInputType.number,
                  validator: Validators.isRequired,
                  hintText: " e.g. 422-434-34355-34344",showRequired: true,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Expanded(
                  child: CustomDatetimePicker(
                    firstDate: DateTime.now(),
                    validator: Validators.dateTime,
                    initialDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365*20)),
                    labelText: "Expiry Date",hintText: "e.g. 12/24",showRequired: true,
                    onDatePicked: (date) {
                       expireDate=date;
                    },),

                ),
                const SizedBox(width: 6,),
                 Expanded(child: CustomTextField(
                  controller: cardIdController,
                  validator: Validators.isRequired,
                  length: 4,
                  keyboardType: TextInputType.number,
                  labelText: " CVC/CVV",hintText: "e.g. 414",showRequired: true,)),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0,left: 6),
                  child: Image.asset(AssetPath.cardImg,height: 32,width: 49,fit: BoxFit.fill,),
                ),
              ],),


              const SizedBox(height: 25,),
              CustomButton(onPressed: () async {
                if(_key.currentState!.validate()){
                  String? cardNum= cardNoController.text;

                  int expireMonth= expireDate!.month;
                  int expireDay= expireDate!.day;
                  String? cvc= cardIdController.text;
                  String? name= nameController.text;

                  // final cardDetails = CardDetails(
                  //     number: "4242424242424242",
                  //     expirationMonth: 4,
                  //     expirationYear: 24,
                  //     cvc: "242"
                  // );

                  final cardDetails = CardDetails(
                      number: cardNum,
                      expirationMonth: expireMonth,
                      expirationYear: expireDay,
                      cvc: cvc
                  );

                  Stripe.instance.dangerouslyUpdateCardDetails(cardDetails);


                  var billingDetails = BillingDetails(
                    name: name,
                  );


                  try{
                    final paymentMethod = await Stripe.instance.createPaymentMethod(
                        params:  PaymentMethodParams.card(paymentMethodData: PaymentMethodData(
                            billingDetails:billingDetails
                        ))
                    );
                     widget.onCardSave(paymentMethod.id);
                    if(context.mounted){
                      Navigator.pop(context);
                    }


                  } catch(e){
                    showErrorToast(text: "Please provide correct Detail");
                  }

                 // showToast(text: paymentMethod.id);

                }
              }, label: "Save Card"),
              const SizedBox(height: 25,),

            ],
          ),
        ),
      ),
    );
  }
}
