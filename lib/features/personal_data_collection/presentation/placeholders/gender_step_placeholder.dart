import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/gradient_button.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/navigation_button.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/personal_data_button.dart';

import '../../../../core/data/enums/gender.dart';

class GenderStepPlaceholder extends StatelessWidget {
  const GenderStepPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      PersonalDataCollectionCubit,
      PersonalDataCollectionState
    >(
      builder: (context, state) {
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
                  AppStrings.genderQuestion,
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
                        icon: Icons.man,
                        title: AppStrings.male,
                        isSelected: state.person?.gender == Gender.male,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectGender(Gender.male),
                      ),

                      const SizedBox(height: 16),

                      PersonalDataButton(
                        icon: Icons.woman,
                        title: AppStrings.female,
                        isSelected: state.person?.gender == Gender.female,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectGender(Gender.female),
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
                      onTap: context
                          .read<PersonalDataCollectionCubit>()
                          .previousStep,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: GradientButton.navigation(
                        height: 60,
                        title: AppStrings.next,
                        onTap: state.person?.gender != null
                            ? () => context
                                  .read<PersonalDataCollectionCubit>()
                                  .setGender(state.person!.gender!)
                            : () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
