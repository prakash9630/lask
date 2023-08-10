

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/our_services/pages/our_services_page.dart';
import 'package:lask_client/features/profile/pages/profile_page.dart';
import '../../home_page/pages/home_page.dart';
import '../../my_lawyers/pages/my_lawyer_page.dart';

final navProvider = ChangeNotifierProvider<BottomNavProvider>((ref) {
  return BottomNavProvider();
});

class BottomNavProvider extends ChangeNotifier{
  int navIndex=0;

  final List<Widget> navItems = [
    const HomePage(),
    // const CallLawyerPage(),
    const OurServicesPage(fromBasePage: true,),
    // const Text('Call'),
    const MyLawyerPage(fromNavBar: true,),
    const ProfilePage()
  ];
  getLabel(index) {
    switch (index) {
      case 0:
        return BottomNavIconAndLabel(
          name: 'Home',
        );
      case 1:
        return BottomNavIconAndLabel(
          name: 'Call',
        );
      // case 3:
      //   return BottomNavIconAndLabel(
      //     name: 'Call',
      //   );
      case 2:
        return BottomNavIconAndLabel(
          name: 'My Lawyers',
        );
      default:
        return BottomNavIconAndLabel(
          name: 'Profile',
        );
    }
  }

  changeNavIndex(int index){
    navIndex=index;
    notifyListeners();
  }
  getItem() {
    return navItems[navIndex];
  }
}
class BottomNavIconAndLabel {
  final String name;
  BottomNavIconAndLabel({
    required this.name,
  });
}