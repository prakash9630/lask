
 import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../repo/invoice_repo.dart';
import 'invoice_detail_state.dart';

 final invoiceDetailNotifyProvider = StateNotifierProvider<InvoiceDetailNotifier,InvoiceDetailState>((ref) {
  return InvoiceDetailNotifier(ref);
 });


class InvoiceDetailNotifier extends StateNotifier<InvoiceDetailState>{
  InvoiceDetailNotifier(this.ref):super(InvoiceDetailState.initial());
  final Ref ref;


  void getInvoiceDetail(int id)async{
    final response =await ref.read(invoiceRepoProvider).getInvoiceDetail(id: id.toString());
    response.fold(
            (l) {
            },
            (r) => {
            });
  }
}