import 'package:flutter/material.dart';
import 'package:lask_client/widgets/custom_appbar.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class CustomSliverAppBar extends StatelessWidget {
   CustomSliverAppBar(
      {Key? key,required this.title, required this.child,this.onRefresh,this.actions,this.onLeadingTap,this.bottomNavBar,this.isPageable,
        this.onNotification,this.bottomSheet
      })
      : super(key: key);
  final Widget child;
  final String title;
   bool? isPageable=false;
  final Widget? bottomNavBar;
  final void Function()? onLeadingTap;
  final List<Widget>? actions;
  final void Function()? onRefresh;
  final Widget? bottomSheet;
  final bool Function(ScrollEndNotification)? onNotification;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
          body: isPageable==true?NotificationListener<ScrollEndNotification>(
            onNotification:onNotification ,
              child: childWidget()):childWidget(),
        bottomNavigationBar: bottomNavBar,
        bottomSheet: bottomSheet,
      ),
    );
  }

  Widget childWidget(){
    return RefreshIndicator(
      onRefresh:()async{
       if( onRefresh!=null)onRefresh!();
      } ,
      child: CustomScrollView(
        slivers: [
          CustomAppbar(title: title,actions: actions,
              floating: true,
              snap: true,
              onLeadingTap:onLeadingTap!=null? () {
                onLeadingTap!();
              }:null),
          SliverToBoxAdapter(
            child: child,
          )
        ],
      ),
    );
  }
}
