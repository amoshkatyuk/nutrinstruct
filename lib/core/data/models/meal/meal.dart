import 'package:json_annotation/json_annotation.dart';

import '../food/food.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  final String name;
  final int calories;
  final List<Food> foods;

  Meal({required this.name, required this.calories, required this.foods});

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}
