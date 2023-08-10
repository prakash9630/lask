
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';

final homeRepoProvider = Provider<HomePageRepo>((ref)=>HomePageRepo());

class HomePageRepo{
  final ApiManager _api=getIt<ApiManager>();
  static const String clientDashboardApi='client/dashboard/';

  Future<Either<Failure,dynamic>> fetchClientDashboard(){
    return apiBase(_api.dio!.get(clientDashboardApi));
  }
}