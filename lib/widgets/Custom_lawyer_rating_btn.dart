
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/provider/filter_provider.dart';

class CustomLawyerRatingBtn extends ConsumerWidget {
   const CustomLawyerRatingBtn({Key? key,required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final filterProv=ref.watch(filterProvider);
    return Container(
      height: 35,
        width: 64,
      decoration: BoxDecoration(
        borderRadius:const  BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1,color: AppColors.primaryColor)
      ),
      child:  Center(
        child: Text("${index+1} stars",
        style: const TextStyle(color: AppColors.primaryColor,fontSize: 12,fontWeight: FontWeight.w500),),

      ),
    );
  }
}
