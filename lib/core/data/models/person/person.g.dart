// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  age: (json['age'] as num?)?.toInt(),
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
  parameters: json['parameters'] == null
      ? null
      : Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
  activityLevel: $enumDecodeNullable(
    _$ActivityLevelEnumMap,
    json['activityLevel'],
  ),
  purpose: $enumDecodeNullable(_$PurposesEnumMap, json['purpose']),
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'age': instance.age,
  'gender': _$GenderEnumMap[instance.gender],
  'parameters': instance.parameters,
  'activityLevel': _$ActivityLevelEnumMap[instance.activityLevel],
  'purpose': _$PurposesEnumMap[instance.purpose],
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$ActivityLevelEnumMap = {
  ActivityLevel.zeroActivity: 'zeroActivity',
  ActivityLevel.lightActivity: 'lightActivity',
  ActivityLevel.normalActivity: 'normalActivity',
  ActivityLevel.highActivity: 'highActivity',
};

const _$PurposesEnumMap = {
  Purposes.decrease: 'decrease',
  Purposes.balance: 'balance',
  Purposes.increase: 'increase',
};
