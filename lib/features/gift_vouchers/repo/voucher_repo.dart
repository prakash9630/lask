import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';
import '../../../core/services/service_locator.dart';

final voucherRepoProvider = Provider<VoucherRepo>((ref) =>VoucherRepo());

class VoucherRepo{
  final ApiManager _api= getIt<ApiManager>();
  static const String voucherApi="voucher/";
  static const String calWithGiftVoucherApi="call/giftvoucher/";

  EitherResponse<dynamic> fetchVoucher({String? url,Map<String,dynamic>? params}){
    return apiBase(_api.dio!.get(url??voucherApi,queryParameters: params));
  }
  EitherResponse<dynamic> giftVoucherCall({Map<String,dynamic>? data}){
    return apiBase(_api.dio!.post(calWithGiftVoucherApi,queryParameters: data));
  }
}