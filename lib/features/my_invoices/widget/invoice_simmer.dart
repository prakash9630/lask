import 'package:flutter/material.dart';
import '../../../widgets/custom_shimmers.dart';

class InvoiceSimmer extends StatelessWidget {
  const InvoiceSimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 22),
      child: Column(children: [
        CustomShimmers.containerShimmer(
            height: 50
        ),
        const SizedBox(height: 25,),
        ...List.generate(7, (index) =>
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CustomShimmers.containerShimmer(height: 90),
            )
        )
      ],),
    );
  }
}
