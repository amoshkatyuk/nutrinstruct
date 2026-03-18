import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/data/enums/purposes.dart';

import '../../../../core/assets/app_text_styles/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../shared/presentation/buttons/gradient_button.dart';
import '../../../shared/presentation/buttons/navigation_button.dart';
import '../../../shared/presentation/buttons/personal_data_button.dart';
import '../../domain/cubit/personal_data_collection_cubit.dart';
import '../../domain/cubit/personal_data_collection_state.dart';

class PurposeStepPlaceholder extends StatefulWidget {
  const PurposeStepPlaceholder({super.key});

  @override
  State<PurposeStepPlaceholder> createState() => _PurposeStepPlaceholderState();
}

class _PurposeStepPlaceholderState extends State<PurposeStepPlaceholder> {
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
                  AppStrings.purposeQuestion,
                  style: AppTextStyles.headerDark,
                ),
                const SizedBox(height: 6),
                Text(
                  AppStrings.purposeQuestionSubtitle,
                  style: AppTextStyles.bodyLight,
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      PersonalDataButton(
                        icon: Icons.trending_down_rounded,
                        title: AppStrings.decreaseWeightTitle,
                        subtitle: AppStrings.decreaseWeightSubtitle,
                        isSelected: state.person?.purpose == Purposes.decrease,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectPurpose(Purposes.decrease),
                      ),

                      const SizedBox(height: 16),

                      PersonalDataButton(
                        icon: Icons.trending_flat_rounded,
                        title: AppStrings.balanceWeightTitle,
                        subtitle: AppStrings.balanceWeightSubtitle,
                        isSelected: state.person?.purpose == Purposes.balance,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectPurpose(Purposes.balance),
                      ),

                      const SizedBox(height: 16),

                      PersonalDataButton(
                        icon: Icons.trending_up_rounded,
                        title: AppStrings.increaseWeightTitle,
                        subtitle: AppStrings.increaseWeightSubtitle,
                        isSelected: state.person?.purpose == Purposes.increase,
                        onTap: () => context
                            .read<PersonalDataCollectionCubit>()
                            .selectPurpose(Purposes.increase),
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
                                  .setPurpose(state.person!.purpose!)
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
