import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';

class CircledCheckmark extends StatelessWidget {
  const CircledCheckmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(shape: .circle, color: AppColors.lightPink),
      child: Center(child: Icon(Icons.check, color: AppColors.pink)),
    );
  }
}
