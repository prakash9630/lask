
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/support_ticket/provider/support_state.dart';
import 'package:lask_client/features/support_ticket/repo/support_repo.dart';

import '../model/support_model.dart';

final supportNotifyProvider = StateNotifierProvider<SupportNotifier,SupportState >((ref) {
  return SupportNotifier(ref);
});


class SupportNotifier extends StateNotifier<SupportState>{
  SupportNotifier(this.ref):super(SupportState.initial());
  Ref ref;

  SupportModel? model;
  List<Support> supports=[];

  bool supportPageNotify(ScrollEndNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (state.model?.next != null) {
        getData(url: state.model?.next);
      }
    }
    return true;
  }

  Future<void> getData({String? url}) async {
    final response=await ref.read(supportRepoProvider).getSupportTicket(url);

    if(url==null){
      state= response.fold((l){
        return state.copyWith(failure: l,pageLoading: false);
      }, (r) {
        model = SupportModel.fromJson(r);
        supports= model?.results??[];
        return state.copyWith(pageLoading: false,model:model,status: const FormStatus.success(),supports: supports);
      });
    }else{
      state= response.fold((l){
        return state;
      }, (r) {
        model = SupportModel.fromJson(r);
        supports.addAll(model?.results??[]);
        return state.copyWith(pageLoading: true,model:model,status: const FormStatus.success(),supports: supports);
      });
      state=state.copyWith(pageLoading: false);
    }

  }
}