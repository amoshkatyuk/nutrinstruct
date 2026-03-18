import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/data/models/parameters/parameters.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';

import '../../../../core/assets/app_text_styles/app_text_styles.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../shared/presentation/buttons/gradient_button.dart';
import '../../../shared/presentation/buttons/navigation_button.dart';
import '../../../shared/presentation/text_fields/data_text_field.dart';
import '../../domain/cubit/personal_data_collection_cubit.dart';

class ParametersStepPlaceholder extends StatefulWidget {
  const ParametersStepPlaceholder({super.key});

  @override
  State<ParametersStepPlaceholder> createState() =>
      _ParametersStepPlaceholderState();
}

class _ParametersStepPlaceholderState extends State<ParametersStepPlaceholder> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      PersonalDataCollectionCubit,
      PersonalDataCollectionState
    >(
      builder: (context, state) {
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
                      AppStrings.parametersQuestion,
                      style: AppTextStyles.headerDark,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      AppStrings.parametersQuestionSubtitle,
                      style: AppTextStyles.bodyLight,
                    ),
                  ],
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        AppStrings.heightLabel,
                        style: AppTextStyles.textFieldLabel,
                      ),
                      const SizedBox(height: 10),
                      DataTextField(controller: _heightController),
                      const SizedBox(height: 40),
                      Text(
                        AppStrings.weightLabel,
                        style: AppTextStyles.textFieldLabel,
                      ),
                      const SizedBox(height: 10),
                      DataTextField(controller: _weightController),
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
                            ? () {
                                final height = int.tryParse(
                                  _heightController.text,
                                );
                                final weight = double.tryParse(
                                  _weightController.text,
                                );

                                if (height == null || weight == null) return;

                                context
                                    .read<PersonalDataCollectionCubit>()
                                    .setParameters(
                                      Parameters(
                                        height: height,
                                        weight: weight,
                                      ),
                                    );
                              }
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
