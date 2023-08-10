
import 'package:flutter/cupertino.dart';
import 'package:lask_client/widgets/custom_shimmers.dart';

class TariffsShimmer extends StatelessWidget {
  const TariffsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 22,),

        CustomShimmers.containerShimmer(
          height: 30,
          width: 300,
        ),
        const SizedBox(height: 10,),
        ...List.generate(3, (index) =>  Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: CustomShimmers.containerShimmer(
            height: 20,
          ),
        ),),
        const SizedBox(height: 25,),

        ...List.generate(6, (index) =>
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomShimmers.containerShimmer(
                height: 90,
              ),
            ),)
      ],
    );
  }
}
