import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/circled_checkmark.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/gradient_button.dart';

import '../widgets/nutrinstruct_logo.dart';

class InitialStepPlaceholder extends StatelessWidget {
  const InitialStepPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: Column(
          mainAxisSize: .max,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  NutrinstructLogo(),

                  const SizedBox(height: 20),

                  Text(AppStrings.nutrinstruct, style: AppTextStyles.header),

                  const SizedBox(height: 20),

                  Text(
                    AppStrings.welcomeText,
                    style: AppTextStyles.bodyLight,
                    textAlign: .center,
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircledCheckmark(),
                              const SizedBox(width: 12),
                              Text(AppStrings.individualNutritionPlan),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircledCheckmark(),
                              const SizedBox(width: 12),
                              Text(AppStrings.purposeActivityTracking),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircledCheckmark(),
                              const SizedBox(width: 12),
                              Text(AppStrings.aiRecommendations),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GradientButton(title: 'Начать', onTap: () {}, height: 54),
          ],
        ),
      ),
    );
  }
}
