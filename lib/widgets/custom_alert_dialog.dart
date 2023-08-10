import 'package:flutter/material.dart';
import '../core/consts/asset_path.dart';
import '../core/consts/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.btnText,
  }) : super(key: key);

  final String label;
  final String btnText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      title: Column(
        children: [
          Image.asset(
            AssetPath.logoWithTitle,
            height: 50,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffC5BFBF),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: AppColors.primaryColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'CANCEL',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            onPressed.call();
            Navigator.pop(context);
          },
          child: Text(
            btnText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
