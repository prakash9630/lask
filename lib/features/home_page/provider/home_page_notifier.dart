
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/model/form_status.dart';
import 'package:lask_client/features/home_page/model/hompage_model.dart';

import '../repo/home_page_repo.dart';
import 'home_page_state.dart';

final homePageNotifyProvider = StateNotifierProvider<HomePageNotifier,HomePageState>((ref) {
  return HomePageNotifier(ref);
});

class HomePageNotifier extends StateNotifier<HomePageState>{
  HomePageNotifier(this.ref):super(HomePageState.initial());
  final Ref ref;

  Future<void> getClientDashboard()async{
    final response= await ref.read(homeRepoProvider).fetchClientDashboard();
    state=response.fold((l) => state.copyWith(status: const FormStatus.error(),failure: l),
            (r) {
                HomePageModel model=HomePageModel.fromJson(r);
              return state.copyWith(status: const FormStatus.success(),model: model,recentCalls: model.recentCalls);
            });
  }
}