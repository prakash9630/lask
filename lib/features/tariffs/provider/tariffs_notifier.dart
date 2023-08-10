import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/tariffs/model/tariffs_model.dart';
import 'package:lask_client/features/tariffs/provider/tariffs_state.dart';
import 'package:lask_client/features/tariffs/repo/tariffs_repo.dart';

final tariffsNotifyProvider = StateNotifierProvider.autoDispose<TariffsNotifier, TariffsState>((ref) {
  return TariffsNotifier(ref);
});

class TariffsNotifier extends StateNotifier<TariffsState> {
  TariffsNotifier(this.ref) : super(TariffsState.initial());
  final Ref ref;
  List<Tariffs> tariffsList=[];

  void selectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  bool tariffsPaginationNotifier(ScrollEndNotification notification,
      {bool search = false,Map<String,dynamic>? params}) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (state.model?.next!= null) {
        print(state.model?.next);
        getTariffs(url: state.model?.next);
      }
    }
    return true;
  }

  Future<void> getTariffs({String? url}) async {
    final response = await ref.read(tariffsRepoProvider).getTariffs(url: url);
    if (url == null) {
      state = response.fold((l) {
        return state.copyWith(
            status: const FormStatus.error(), failure: l, pageLoading: false);
      }, (r) {
        TariffsModel model = TariffsModel.fromJson(r);
        tariffsList = model.tariffs ?? [];
        return state.copyWith(
            status: const FormStatus.success(),
            pageLoading: false,
            model: model,
            tariffs: tariffsList);
      });
    } else  {
      state= response.fold((l) => state,
              (r) {
                TariffsModel model= TariffsModel.fromJson(r);
                tariffsList.addAll(model.tariffs??[]);
            return state.copyWith(status: const FormStatus.success(),model: model,tariffs: tariffsList,pageLoading: true);
          });
      state =state.copyWith(pageLoading: false);
    }
  }
}
