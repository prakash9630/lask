
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_manager.dart';
import '../../../core/network/api_base.dart';
import '../../../core/services/service_locator.dart';

final myLawyerProvider = Provider<MyLawyersRepo>((ref) => MyLawyersRepo());

class  MyLawyersRepo{
  static const String lawyerApi="lawyer/";
  final ApiManager _api= getIt<ApiManager>();

  Future<Either<Failure,dynamic>> fetchLawyers({String? url,Map<String,dynamic>? params}){
    return apiBase(_api.dio!.get(url??lawyerApi,queryParameters: params));
  }
}