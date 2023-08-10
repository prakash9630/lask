
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/features/about_us/model/about_us_model.dart';

import '../../../core/services/service_locator.dart';


final aboutUsRepoProvider = Provider<AboutUsRepo>((ref) {
  return AboutUsRepo();
});

class AboutUsRepo{
  final _api= getIt<ApiManager>();
  static const String aboutUsApi='about-us/';

  Future<AboutUsModel?> aboutUs() async {
    final response=await apiBase(_api.dio!.get(aboutUsApi));
     return response.fold((l) => null, (r){
       var model= AboutUsModel.fromJson(r['about_us']);
       return model;
     });
  }
}