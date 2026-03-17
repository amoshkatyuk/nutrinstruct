import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors/app_colors.dart';
import '../../../../core/assets/gradients/app_gradients.dart';

class NutrinstructLogo extends StatelessWidget {
  const NutrinstructLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: AppGradients.lilacBlue,
        borderRadius: .circular(26),
      ),
      child: Center(
        child: Icon(Icons.event_repeat, color: AppColors.white, size: 50),
      ),
    );
  }
}
