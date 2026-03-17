import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/gradient_button.dart';
import 'package:nutrinstruct/features/shared/presentation/text_fields/data_text_field.dart';

class AgeStepPlaceholder extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  AgeStepPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 16,
          top: 20,
          right: 16,
          bottom: 20,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppStrings.userAgeQuestion,
                  style: AppTextStyles.headerDark,
                ),
                const SizedBox(height: 6),
                Text(
                  AppStrings.ageQuestionSubtitle,
                  style: AppTextStyles.bodyLight,
                ),
              ],
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: DataTextField(controller: controller),
                  ),
                ],
              ),
            ),

            GradientButton.navigation(
              height: 60,
              onTap: () {},
              title: AppStrings.next,
            ),
          ],
        ),
      ),
    );
  }
}
