
import 'package:flutter/material.dart';
import 'package:lask_client/helper/widit_util/widget_util.dart';

class PurposeListView extends StatelessWidget {
  const PurposeListView({Key? key,required this.label,required this.isSelected}) : super(key: key);
  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
        Expanded(flex: 12,
            child: textW400S16(label: label)),
        const Spacer(),
        Expanded(
          flex: 1,
          child: IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Radio(value: true, groupValue: isSelected, onChanged: (v){}),
            ),
          ),
        )
      ],),
    );
  }
}
