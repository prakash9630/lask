
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/network/api_base.dart';
import 'package:lask_client/core/network/api_manager.dart';
import 'package:lask_client/core/services/service_locator.dart';
import 'package:lask_client/core/typedefs/typedefs.dart';

final notificationRepoProvider = Provider<NotificationRepo>((ref)=>NotificationRepo());
class NotificationRepo{
  static const String notificationApi="notification/";
  final ApiManager _api=getIt<ApiManager>();

  EitherResponse<dynamic> getNotification({String? url}){
    return apiBase(_api.dio!.get(url??notificationApi));
  }
}