import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/gradient_button.dart';
import 'package:nutrinstruct/features/shared/presentation/text_fields/data_text_field.dart';

class AgeStepPlaceholder extends StatefulWidget {
  const AgeStepPlaceholder({super.key});

  @override
  State<AgeStepPlaceholder> createState() => _AgeStepPlaceholderState();
}

class _AgeStepPlaceholderState extends State<AgeStepPlaceholder> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    child: DataTextField(controller: _controller),
                  ),
                ],
              ),
            ),

            GradientButton.navigation(
              height: 60,
              onTap: () {
                final age = int.tryParse(_controller.text);
                context.read<PersonalDataCollectionCubit>().setAge(age);
              },
              title: AppStrings.next,
            ),
          ],
        ),
      ),
    );
  }
}
