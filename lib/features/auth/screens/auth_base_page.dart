import 'package:flutter/material.dart';

import '../../../core/consts/asset_path.dart';
import '../widgets/widgets.dart';

class AuthBasePage extends StatelessWidget {
  const AuthBasePage({
    Key? key,
    required this.child,
    required this.image,
    this.imageHeight = 322,
  }) : super(key: key);
  final Widget child;
  final String image;
  final double imageHeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: imageHeight,
                  color: Colors.black.withOpacity(0.4),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top + 23,
                    left: 23,
                  ),
                  child: Image.asset(AssetPath.logoWithTitleWhite),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: imageHeight - 42,
                    ),
                    CurveContainer(
                      child: child,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
