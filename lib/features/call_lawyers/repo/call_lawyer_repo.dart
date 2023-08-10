
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';
import '../../../core/services/service_locator.dart';

final callLawyerRepoProvider = Provider<CallLawyerRepo>((ref)=>CallLawyerRepo());

class CallLawyerRepo{
  static const String clientCallLogsApi='client/call/logs/';
  final ApiManager _api= getIt<ApiManager>();
  Future<Either<Failure,dynamic>> callLogs({String? url,Map<String,dynamic>? params}){
    return apiBase(_api.dio!.get(url??clientCallLogsApi,queryParameters: params));
  }
}