import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/gradient_button.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/navigation_button.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/personal_data_button.dart';

class GenderStepPlaceholder extends StatelessWidget {
  const GenderStepPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          top: 20,
          right: 16,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppStrings.yourGenderQuestion,
              style: AppTextStyles.headerDark,
            ),
            const SizedBox(height: 6),
            Text(
              AppStrings.genderQuestionSubtitle,
              style: AppTextStyles.bodyLight,
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  PersonalDataButton(
                    onTap: () {},
                    icon: Icons.man,
                    title: AppStrings.male,
                  ),

                  const SizedBox(height: 16),

                  PersonalDataButton(
                    onTap: () {},
                    icon: Icons.woman,
                    title: AppStrings.female,
                  ),
                ],
              ),
            ),

            Row(
              children: [
                NavigationButton(
                  width: 60,
                  height: 60,
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () {},
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: GradientButton.navigation(
                    height: 60,
                    onTap: () {},
                    title: AppStrings.next,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
