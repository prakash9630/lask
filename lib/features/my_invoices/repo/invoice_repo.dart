
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

final invoiceRepoProvider = Provider<InvoiceRepo>((ref) =>InvoiceRepo());

class InvoiceRepo{
  static const String lawyerInvoiceApi='client-invoice/';
  static const String organizationApi='organization/';
  static const String invoiceExportApi='lawyer/invoice/export/';

  final ApiManager _api= getIt<ApiManager>();
  EitherResponse<dynamic> getInvoice({String? url,Map<String,dynamic>? params}){
    return apiBase(_api.dio!.get(url??lawyerInvoiceApi,queryParameters: params));
  }

  EitherResponse<dynamic> getInvoiceDetail({required String id}){
    return apiBase(_api.dio!.get(lawyerInvoiceApi+id));
  }

  EitherResponse<dynamic> getOrganization({String? url}){
    return apiBase(_api.dio!.get(organizationApi),showProgressDialogue: true);
  }

  EitherResponse<dynamic> invoiceExport(Map<String,dynamic> params,String filePath){
    return apiBase(_api.dio!.download(invoiceExportApi,filePath,queryParameters: params,));
  }

}