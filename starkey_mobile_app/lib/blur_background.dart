import 'dart:ui';
import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  final Widget child;

  const BlurBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Center(child: child),
      ],
    );
  }
}
