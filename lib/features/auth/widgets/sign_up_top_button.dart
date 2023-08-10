import 'package:flutter/material.dart';

class SignUpTopButton extends StatelessWidget {
  const SignUpTopButton({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
        )
      ],
    );
  }
}
