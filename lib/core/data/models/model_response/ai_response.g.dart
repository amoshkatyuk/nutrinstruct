// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiResponse _$AiResponseFromJson(Map<String, dynamic> json) => AiResponse(
  calories: (json['calories'] as num).toInt(),
  proteins: (json['proteins'] as num).toInt(),
  fats: (json['fats'] as num).toInt(),
  carbonhydrates: (json['carbonhydrates'] as num).toInt(),
  waterLiters: (json['waterLiters'] as num).toDouble(),
  meals: (json['meals'] as List<dynamic>)
      .map((e) => Meal.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AiResponseToJson(AiResponse instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'proteins': instance.proteins,
      'fats': instance.fats,
      'carbonhydrates': instance.carbonhydrates,
      'waterLiters': instance.waterLiters,
      'meals': instance.meals,
    };
