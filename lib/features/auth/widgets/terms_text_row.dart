import 'package:flutter/material.dart';

class TermsTextRow extends StatelessWidget {
  const TermsTextRow({
    super.key,
    required this.count,
    required this.data,
  });
  final int count;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$count."),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              data,
            ),
          )
        ],
      ),
    );
  }
}
