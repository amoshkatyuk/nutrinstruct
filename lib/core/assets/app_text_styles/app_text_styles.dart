import 'package:flutter/material.dart';

import '../app_colors/app_colors.dart';

class AppTextStyles {
  static const TextStyle buttonText = TextStyle(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: .bold,
  );

  static const TextStyle header = TextStyle(
    color: AppColors.lilac,
    fontSize: 24,
    fontWeight: .bold,
  );

  static const TextStyle headerDark = TextStyle(
    color: AppColors.dark,
    fontSize: 24,
    fontWeight: .bold,
  );

  static const TextStyle bodyLight = TextStyle(
    color: AppColors.bodyGrey,
    fontSize: 18,
    fontWeight: .normal,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.dark,
    fontSize: 18,
    fontWeight: .bold,
  );

  static const TextStyle title = TextStyle(
    color: AppColors.darkGrey,
    fontSize: 16,
    fontWeight: .normal,
  );

  static const TextStyle subtitle = TextStyle(
    color: AppColors.darkGrey,
    fontSize: 14,
    fontWeight: .bold,
  );

  static const TextStyle textFieldLabel = TextStyle(
    color: AppColors.bodyGrey,
    fontSize: 18,
    fontWeight: .bold,
  );

  static const TextStyle nutrientCardBold = TextStyle(
    color: AppColors.dark,
    fontSize: 16,
    fontWeight: .bold,
  );

  static const TextStyle nutrientCardNormal = TextStyle(
    color: AppColors.asphalt,
    fontSize: 14,
    fontWeight: .normal,
  );
}
