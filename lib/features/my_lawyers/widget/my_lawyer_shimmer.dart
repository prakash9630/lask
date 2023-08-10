

import 'package:flutter/material.dart';
import '../../../widgets/custom_shimmers.dart';

class MyLawyerShimmer extends StatelessWidget {
  const MyLawyerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23,top: 22),
      child: Column(children: [
        CustomShimmers.containerShimmer(
            height: 50
        ),
        const SizedBox(height: 25,),
        ...List.generate(4, (index) =>
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomShimmers.containerShimmer(height: 178),
            )
        )

      ],),
    );
  }
}
