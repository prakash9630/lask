import 'package:flutter/material.dart';

class CurveContainer extends StatelessWidget {
  const CurveContainer({
    super.key,
    required this.child,
    this.showShadow = false,
  });

  final Widget child;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                  color: Colors.black.withOpacity(0.1),
                ),
              ]
            : null,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
        child: child,
      ),
    );
  }
}
