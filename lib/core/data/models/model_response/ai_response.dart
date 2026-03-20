import 'package:json_annotation/json_annotation.dart';

import '../meal/meal.dart';

part 'ai_response.g.dart';

@JsonSerializable()
class AiResponse {
  final int calories;
  final int proteins;
  final int fats;
  final int carbonhydrates;
  final double waterLiters;
  final List<Meal> meals;

  AiResponse({
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.carbonhydrates,
    required this.waterLiters,
    required this.meals,
  });

  factory AiResponse.fromJson(Map<String, dynamic> json) =>
      _$AiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AiResponseToJson(this);
}
