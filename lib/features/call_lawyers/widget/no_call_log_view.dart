
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/asset_path.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/features/base_page/provider/bottom_nav_provider.dart';
import 'package:lask_client/widgets/empty_page_btn.dart';
import '../../../helper/widit_util/widget_util.dart';

class NoCallLogView extends ConsumerWidget {
  const NoCallLogView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final bottomNavProv= ref.read(navProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 30),
            child: Image.asset(AssetPath.callLog),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: textW500S15(label: 'No Call History Found!',color: AppColors.lightGreyColor),
          ),
          EmptyPageBtn(showIcon: false, label: "Find Lawyer", onTap: (){
           bottomNavProv.changeNavIndex(3);
          })
        ],
      ),
    );
  }
}
