import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/home_page/provider/home_page_notifier.dart';
import '../../../core/consts/asset_path.dart';
import '../widget/home_app_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homePageProv = ref.watch(homePageNotifyProvider.notifier);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: RefreshIndicator(
        onRefresh: homePageProv.getClientDashboard,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(AssetPath.homeBackground),
              HomeAppBar(),
            ],
          ),
        ),
      ),
    );
  }
}
