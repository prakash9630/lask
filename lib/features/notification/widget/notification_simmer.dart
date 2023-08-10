
import 'package:flutter/cupertino.dart';
import 'package:lask_client/widgets/custom_shimmers.dart';

class NotificationSimmer extends StatelessWidget {
  const NotificationSimmer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 22),
          child: CustomShimmers.containerShimmer(
            height: 25
          ),
        ),
        const SizedBox(height: 25,),
        ...List.generate(4, (index){
          return  Padding(
            padding: const EdgeInsets.only(bottom:5),
            child: CustomShimmers.containerShimmer(
                height: 300
            ),
          );
        })
      ],
    );
  }
}
