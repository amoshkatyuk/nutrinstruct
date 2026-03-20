// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
  name: json['name'] as String,
  weightGrams: (json['weightGrams'] as num).toInt(),
  calories: (json['calories'] as num).toInt(),
);

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
  'name': instance.name,
  'weightGrams': instance.weightGrams,
  'calories': instance.calories,
};
