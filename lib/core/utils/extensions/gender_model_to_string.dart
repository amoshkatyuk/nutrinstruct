import 'package:nutrinstruct/core/data/enums/gender.dart';

extension GenderModelToString on Gender {
  String get label {
    switch (this) {
      case Gender.male:
        return 'Мужской';
      case Gender.female:
        return 'Женский';
    }
  }
}
