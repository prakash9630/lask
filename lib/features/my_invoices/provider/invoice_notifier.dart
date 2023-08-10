
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/my_invoices/model/invoice_model.dart';
import 'package:lask_client/features/my_invoices/repo/invoice_repo.dart';
import 'invoice_state.dart';

final invoiceNotifyProvider = StateNotifierProvider<InvoiceNotifier,InvoiceState>((ref) {
  return InvoiceNotifier(ref);
});

class InvoiceNotifier extends StateNotifier<InvoiceState>{
  InvoiceNotifier(this.ref):super(InvoiceState.initial());
  final Ref ref;
  List<Invoices> invoiceList=[];

  bool invoicePageNotifier(ScrollEndNotification scrollEndNotification){
    if(scrollEndNotification.metrics.pixels==scrollEndNotification.metrics.maxScrollExtent){
      if(state.model?.next!=null){
        getInvoice(url: state.model?.next);
}
    }
    return true;
  }

  void getInvoice({String? url,Map<String,dynamic>? params}) async{
   final response= await ref.read(invoiceRepoProvider).getInvoice(url: url,params: params);
   if(url==null){
     state= response.fold(
             (l) => state.copyWith(status: const FormStatus.error(),pageLoading: false,failure: l),
             (r) {
               InvoiceModel model= InvoiceModel.fromJson(r);
               invoiceList=model.invoices??[];
               return state.copyWith(status: const FormStatus.success(),pageLoading: false,model: model,invoices: invoiceList);
         });
   }else
     {
       state= response.fold(
               (l) => state,
               (r) {
                 InvoiceModel model= InvoiceModel.fromJson(r);
                 invoiceList.addAll(model.invoices??[]);
             return state.copyWith(status: const FormStatus.success(),pageLoading: true,model: model,invoices: invoiceList);
           });
       state=state.copyWith(pageLoading: false);
     }
  }
}

