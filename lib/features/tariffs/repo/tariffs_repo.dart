
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import '../../../core/services/service_locator.dart';

final tariffsRepoProvider = Provider<TariffsRepo>((ref) {
  return TariffsRepo();
});

class TariffsRepo{
  final ApiManager _api=getIt<ApiManager>();

  static const tariffsApi="call/tariff/";
  Future<Either<Failure,dynamic>> getTariffs({String? url}){
    return  apiBase(_api.dio!.get(url??tariffsApi));
  }
}