import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/data/models/meal/meal.dart';
import 'package:nutrinstruct/core/utils/extensions/int_to_weight.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/meal_calories.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/point_mark.dart';
import 'package:nutrinstruct/features/shared/presentation/cards/app_card.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(meal.name, style: AppTextStyles.nutrientCardBold),
              MealCalories(value: meal.calories.toCalories()),
            ],
          ),

          const SizedBox(height: 12),

          Column(
            children: meal.foods.map((food) {
              return Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    children: [
                      PointMark(),
                      const SizedBox(width: 8),
                      Text(food.name, style: AppTextStyles.nutrientCardBold),
                    ],
                  ),
                  Text(
                    food.weightGrams.toGram(),
                    style: AppTextStyles.nutrientCardBold,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
