
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/call_lawyers/model/call_lawyer_model.dart';
import '../../home_page/model/hompage_model.dart';
import '../repo/call_lawyer_repo.dart';
import 'call_lawyer_state.dart';

final callLawyerNotifyProvider = StateNotifierProvider<CallLawyerNotifier,CallLawyerState >((ref) {
  return CallLawyerNotifier(ref);
});

class CallLawyerNotifier extends StateNotifier<CallLawyerState>{
  CallLawyerNotifier(this.ref):super(CallLawyerState.initial());
  final Ref ref;
  CallLawyerModel? model;
  List<RecentCalls> callList=[];

  bool callLogPaginationNotifier(ScrollEndNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (state.model?.next!= null) {
        getCallLog(url: state.model?.next);
      }
    }
    return true;
  }

  Future<void> getCallLog({String? url,Map<String,dynamic>? params})async{

    final request= await ref.read(callLawyerRepoProvider).callLogs(url: url,params: params);
    if(url==null){
      state=request.fold(
              (l) => state.copyWith(status: const FormStatus.error(),pageLoading: false),
              (r) {
            model= CallLawyerModel.fromJson(r);
            callList= model?.callLogs??[];
            return state.copyWith(status: const FormStatus.success(),pageLoading: false,model: model,
                callList: callList);
          });
    }else{
      state=request.fold(
              (l) => state,
              (r) {
            model= CallLawyerModel.fromJson(r);
            callList.addAll(model?.callLogs??[]);
            return state.copyWith(status: const FormStatus.success(),pageLoading: true,model: model,
                callList: callList);
          });
      state=state.copyWith(pageLoading: false);
    }
  }

}