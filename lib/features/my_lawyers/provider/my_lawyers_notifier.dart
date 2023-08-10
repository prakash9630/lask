import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/my_lawyers/model/my_lawers_model.dart';
import '../../../core/model/form_status.dart';
import '../../home_page/model/hompage_model.dart';
import '../repo/my_lawyers_repo.dart';
import 'my_lawyers_state.dart';

final myLawyerNotifierProvider =
    StateNotifierProvider<MyLawyersNotifier, MyLawyersState>((ref) {
  return MyLawyersNotifier(ref);
});

class MyLawyersNotifier extends StateNotifier<MyLawyersState> {
  MyLawyersNotifier(this.ref) : super(MyLawyersState.initial());
  final Ref ref;
  MyLawyersModel? model;
  List<Lawyer> lawyersList = [];

  bool lawyerPageNotify(ScrollEndNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (state.model?.next != null) {
        getData(url: state.model?.next);
      }
    }
    return true;
  }

  Future<void> getData({String? url,Map<String,dynamic>? params}) async {
    final response = await ref.read(myLawyerProvider).fetchLawyers(url: url,params: params);
    if (url == null) {
      state = response.fold(
          (l) => state.copyWith(failure: l, status:const  FormStatus.error(),pageLoading: false), (r) {
        MyLawyersModel? model = MyLawyersModel.fromJson(r);
        lawyersList = model.lawyers??[];
        return state.copyWith(status:const FormStatus.success(),pageLoading: false,model: model,lawyers:lawyersList);
      });
    } else {
      state = response.fold((l) => state, (r) {
        MyLawyersModel? model = MyLawyersModel.fromJson(r);
        lawyersList.addAll(model.lawyers??[]);
        return state.copyWith(status:const FormStatus.success(),pageLoading: true,lawyers: lawyersList);
      });
      state=state.copyWith(pageLoading: false);
    }
  }
}
