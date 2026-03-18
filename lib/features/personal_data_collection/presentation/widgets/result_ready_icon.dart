import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors/app_colors.dart';
import '../../../../core/assets/gradients/app_gradients.dart';

class ResultReadyIcon extends StatelessWidget {
  const ResultReadyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: AppGradients.cryLimeGreen,
        borderRadius: .circular(26),
      ),
      child: Center(
        child: Icon(Icons.check_rounded, color: AppColors.dark, size: 50),
      ),
    );
  }
}
