import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/faqs/model/faq_model.dart';
import '../repo/faq_repo.dart';
import 'faq_state.dart';

final faqNotifyProvider = StateNotifierProvider<FaqNotifier, FaqState>((ref) {
  return FaqNotifier(ref);
});

class FaqNotifier extends StateNotifier<FaqState> {
  FaqNotifier(this.ref) : super(FaqState.initial());
  final Ref ref;
  FaqModel? model;
  List<Faqs> faqs=[];

  bool faqPaginationNotifier(ScrollEndNotification notification,
      {bool search = false,Map<String,dynamic>? params}) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (state.model?.next!= null) {
        print(state.model?.next);
        getFaqs(url: state.model?.next);
      }
    }
    return true;
  }

  void getFaqs({String? url}) async {
    final response = await ref.read(faqRepoProvider).fetchFaq(url: url);
    if (url == null) {
      state = response.fold(
          (l) => state.copyWith(
              status: const FormStatus.error(), pageLoading: false,failure: l),
              (r) {
            model= FaqModel.fromJson(r);
            faqs= model?.faqs??[];
        return state.copyWith(
            status: const FormStatus.success(), pageLoading: false,model: model,faqs: faqs);
      });
    } else {
      state = response.fold((l) => state, (r) {
        model= FaqModel.fromJson(r);
       faqs.addAll(model?.faqs??[]);
        return state.copyWith(
            status: const FormStatus.success(), pageLoading: true,model:model ,faqs: faqs);
      });
      state = state.copyWith(pageLoading: false);
    }
  }
}
