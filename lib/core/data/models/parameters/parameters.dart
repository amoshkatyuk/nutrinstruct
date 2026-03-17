import 'package:json_annotation/json_annotation.dart';

part 'parameters.g.dart';

@JsonSerializable()
class Parameters {
  final int height;
  final double weight;

  Parameters({required this.height, required this.weight});

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}
