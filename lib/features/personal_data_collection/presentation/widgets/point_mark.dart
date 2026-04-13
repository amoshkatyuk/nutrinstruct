import 'package:flutter/material.dart';

import '../../../../core/assets/app_colors/app_colors.dart';

class PointMark extends StatelessWidget {
  const PointMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.lightBlue, shape: .circle),
      width: 8,
      height: 8,
    );
  }
}
