import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:nutrinstruct/core/data/models/parameters/parameters.dart';

import '../../enums/activity_level.dart';
import '../../enums/gender.dart';
import '../../enums/purposes.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int? age;
  final Gender? gender;
  final Parameters? parameters;
  final ActivityLevel? activityLevel;
  final Purposes? purpose;

  const Person({
    this.age,
    this.gender,
    this.parameters,
    this.activityLevel,
    this.purpose,
  });

  Person copyWith({
    int? age,
    Gender? gender,
    Parameters? parameters,
    ActivityLevel? activityLevel,
    Purposes? purpose,
  }) {
    return Person(
      age: age ?? this.age,
      gender: gender ?? this.gender,
      parameters: parameters ?? this.parameters,
      activityLevel: activityLevel ?? this.activityLevel,
      purpose: purpose ?? this.purpose,
    );
  }

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String toRawJson() => jsonEncode(toJson());

  factory Person.fromRawJson(String str) => Person.fromJson(jsonDecode(str));
}
