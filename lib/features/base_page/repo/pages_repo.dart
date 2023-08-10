
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import '../../../core/typedefs/typedefs.dart';

final pagesRepoProvider = Provider<PagesRepo>((ref)=>PagesRepo());

class PagesRepo{
final ApiManager _api=getIt<ApiManager>();
 static const String getPagesApi='info-pages/';

EitherResponse<dynamic> getPages(){
  return apiBase(_api.dio!.get(getPagesApi));
}
}