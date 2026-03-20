// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
  name: json['name'] as String,
  calories: (json['calories'] as num).toInt(),
  foods: (json['foods'] as List<dynamic>)
      .map((e) => Food.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
  'name': instance.name,
  'calories': instance.calories,
  'foods': instance.foods,
};
