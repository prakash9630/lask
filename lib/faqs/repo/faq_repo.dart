

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';

final faqRepoProvider = Provider<FaqRepo>((ref)=>FaqRepo());

class FaqRepo{
  final ApiManager _api=getIt<ApiManager>();
  static const String faqApi='faq/';

  Future<Either<Failure,dynamic>> fetchFaq({String? url}){
    return apiBase(_api.dio!.get(url??faqApi));
  }
}