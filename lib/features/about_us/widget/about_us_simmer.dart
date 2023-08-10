
import 'package:flutter/cupertino.dart';

import '../../../widgets/custom_shimmers.dart';

class AboutUsSimmer extends StatelessWidget {
  const AboutUsSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        children: [
        CustomShimmers.containerShimmer(
          height: 250,
        ),
          const SizedBox(height: 15,),
          ...List.generate(10, (index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CustomShimmers.containerShimmer(
                height: 12
              ),
            );
          })

      ],),
    );
  }
}
