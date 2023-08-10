


import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import '../../../core/services/service_locator.dart';

final serviceRepoProvider = Provider<ServicesRepo>((ref) => ServicesRepo());

class ServicesRepo{
   static const String serviceApi="service/";
    final ApiManager _api= getIt<ApiManager>();

   Future<Either<Failure,dynamic>> fetchServices({String? url,Map<String,dynamic>? query}){
    return apiBase(_api.dio!.get(url??serviceApi,queryParameters:query));
  }
}