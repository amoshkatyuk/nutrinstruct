import 'package:nutrinstruct/core/constants/app_strings.dart';

class AgeValidator {
  static const _minAge = 10;
  static const _maxAge = 100;

  static String? validate(int? value) {
    if (value == null) return AppStrings.fieldRequired;

    if (value < _minAge || value > _maxAge) return AppStrings.invalidAge;

    return null;
  }
}
