
import 'package:auto_route/auto_route.dart';

class ProfileMenuModel{
  ProfileMenuModel({required this.title,required this.iconPath,required this.page});
  String title;
  String iconPath;
  PageRouteInfo<dynamic> page;


}