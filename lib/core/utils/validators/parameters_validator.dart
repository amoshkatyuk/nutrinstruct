import 'package:nutrinstruct/core/constants/app_strings.dart';

import '../../data/models/parameters/parameters.dart';

class ParametersValidator {
  static const _minHeight = 54;
  static const _maxHeight = 251;
  static const _minWeight = 2.13;
  static const _maxWeight = 610.0;

  static String? validate(Parameters? parameters) {
    if (parameters == null) return AppStrings.checkParameters;

    if (parameters.height < _minHeight ||
        parameters.height > _maxHeight ||
        parameters.weight < _minWeight ||
        parameters.weight > _maxWeight) {
      return AppStrings.checkParameters;
    }
    return null;
  }
}
