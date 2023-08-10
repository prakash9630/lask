
import 'package:auto_route/auto_route.dart';

class DrawerMenu{
  String title;
  String? icon;
  PageRouteInfo<dynamic>? page;
  bool? isNetwork;

  DrawerMenu({
    required this.title,
     this.icon,
    this.page,
    this.isNetwork=false,
});
}