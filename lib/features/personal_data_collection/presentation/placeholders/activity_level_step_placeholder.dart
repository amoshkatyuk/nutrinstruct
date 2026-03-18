import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/data/enums/activity_level.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';

import '../../../../core/assets/app_text_styles/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../shared/presentation/buttons/gradient_button.dart';
import '../../../shared/presentation/buttons/navigation_button.dart';
import '../../../shared/presentation/buttons/personal_data_button.dart';

class ActivityLevelStepPlaceholder extends StatefulWidget {
  const ActivityLevelStepPlaceholder({super.key});

  @override
  State<ActivityLevelStepPlaceholder> createState() =>
      _ActivityLevelStepPlaceholderState();
}

class _ActivityLevelStepPlaceholderState
    extends State<ActivityLevelStepPlaceholder> {
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
                  AppStrings.activityLevelQuestion,
                  style: AppTextStyles.headerDark,
                ),
                const SizedBox(height: 6),
                Text(
                  AppStrings.activityLevelQuestionSubtitle,
                  style: AppTextStyles.bodyLight,
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      PersonalDataButton(
                        icon: Icons.airline_seat_recline_extra_rounded,
                        title: AppStrings.zeroActivityTitle,
                        subtitle: AppStrings.zeroActivitySubtitle,
                        isSelected:
                            state.person?.activityLevel ==
                            ActivityLevel.zeroActivity,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectActivityLevel(ActivityLevel.zeroActivity),
                      ),

                      const SizedBox(height: 16),

                      PersonalDataButton(
                        icon: Icons.directions_walk,
                        title: AppStrings.lightActivityTitle,
                        subtitle: AppStrings.lightActivitySubtitle,
                        isSelected:
                            state.person?.activityLevel ==
                            ActivityLevel.lightActivity,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectActivityLevel(ActivityLevel.lightActivity),
                      ),

                      const SizedBox(height: 16),

                      PersonalDataButton(
                        icon: Icons.sports_gymnastics,
                        title: AppStrings.normalActivityTitle,
                        subtitle: AppStrings.normalActivitySubtitle,
                        isSelected:
                            state.person?.activityLevel ==
                            ActivityLevel.normalActivity,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectActivityLevel(ActivityLevel.normalActivity),
                      ),

                      const SizedBox(height: 16),

                      PersonalDataButton(
                        icon: Icons.fitness_center,
                        title: AppStrings.highActivityTitle,
                        subtitle: AppStrings.highActivitySubtitle,
                        isSelected:
                            state.person?.activityLevel ==
                            ActivityLevel.highActivity,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectActivityLevel(ActivityLevel.highActivity),
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
                                  .setActivityLevel(
                                    state.person!.activityLevel!,
                                  )
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
