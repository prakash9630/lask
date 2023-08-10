import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/our_services/model/service_model.dart';
import 'package:lask_client/features/our_services/provider/services_state.dart';
import 'package:lask_client/features/our_services/repo/services_repo.dart';

final serviceNotifyProvider = StateNotifierProvider<ServicesNotifier,ServicesState>((ref) {
  return ServicesNotifier(ref);
});
class ServicesNotifier extends StateNotifier<ServicesState>{
  ServicesNotifier(this.ref):super(ServicesState.initial());
  final Ref ref;

  List<Services> services=[];

  bool servicePaginationNotifier(ScrollEndNotification notification,
      {bool search = false,Map<String,dynamic>? params}) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (state.data?.next!= null) {
        getServices(url: state.data?.next);
      }
    }
    return true;
  }

  void getServices({Map<String,dynamic>? query,String? url})async{
      final response = await ref.read(serviceRepoProvider).fetchServices(url: url,query: query);
      if(url==null){
        state= response.fold((l) {
          return state.copyWith(status: const FormStatus.error(),failure: l,pageLoading: false);
        }, (r) {
              ServiceModel model= ServiceModel.fromJson(r);
              services=model.services??[];
              return state.copyWith(status: const FormStatus.success(),data:model,serviceList: services,pageLoading: false);
            });
      }else
        {
          state= response.fold((l) => state,
                  (r) {
                ServiceModel model= ServiceModel.fromJson(r);
                services.addAll(model.services??[]);
                return state.copyWith(status: const FormStatus.success(),data:model,serviceList: services,pageLoading: true);
              });
          state =state.copyWith(pageLoading: false);
        }
  }
}