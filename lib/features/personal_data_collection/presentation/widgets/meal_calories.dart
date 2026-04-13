import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';

class MealCalories extends StatelessWidget {
  final String value;

  const MealCalories({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.calories,
        borderRadius: .circular(10),
      ),
      padding: .all(6),
      child: Text(value, style: AppTextStyles.nutrientCardBold),
    );
  }
}
