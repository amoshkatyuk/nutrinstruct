import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/assets/app_colors/app_colors.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/nutrient_card.dart';

class DietDetailsPlaceholder extends StatelessWidget {
  const DietDetailsPlaceholder({super.key});

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
              crossAxisAlignment: .start,
              children: [
                Text(
                  AppStrings.dietDetailsTitle,
                  style: AppTextStyles.headerDark,
                ),
                Text(
                  AppStrings.dietDetailsSubtitle,
                  style: AppTextStyles.bodyLight,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      NutrientCard(
                        color: AppColors.calories,
                        icon: Icons.local_fire_department_rounded,
                        title: AppStrings.calories,
                        subtitle: state.aiResponse!.calories.toString(),
                      ),

                      NutrientCard(
                        color: AppColors.protein,
                        icon: Icons.fitness_center_rounded,
                        title: AppStrings.protein,
                        subtitle: state.aiResponse!.proteins.toString(),
                      ),

                      NutrientCard(
                        color: AppColors.carbs,
                        icon: Icons.local_fire_department_rounded,
                        title: AppStrings.carbs,
                        subtitle: state.aiResponse!.carbonhydrates.toString(),
                      ),

                      NutrientCard(
                        color: AppColors.fats,
                        icon: Icons.local_fire_department_rounded,
                        title: AppStrings.fats,
                        subtitle: state.aiResponse!.fats.toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
