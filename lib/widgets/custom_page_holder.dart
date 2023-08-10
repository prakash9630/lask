import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/consts/asset_path.dart';
import '../core/consts/colors.dart';

class CustomPageHolder extends StatelessWidget {
  const CustomPageHolder({Key? key,required this.title,required this.child,this.bottomNavBar,this.onLeadingTap,this.actions,this.floatingActionButton}) : super(key: key);

  final Widget child;
  final String title;
  final Widget? bottomNavBar;
  final void Function()? onLeadingTap;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        appBar: AppBar(
          leading:  InkWell(
            onTap: onLeadingTap ?? () {
                  Navigator.pop(context);
                },
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                AssetPath.iconBack,
              ),
            ),
          ),
          actions: actions,
          centerTitle: true,
          titleTextStyle:const TextStyle(color: AppColors.headerBlack,fontWeight: FontWeight.w600,fontSize: 20),
          backgroundColor: AppColors.whiteColor,
          title: Text(title),
        ),
        body: child,
        bottomNavigationBar: bottomNavBar,
      ),

    );
  }
}
