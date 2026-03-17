import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/data/models/person/person.dart';

abstract class DataCollectionRepository {
  Future<void> savePerson(Person person);

  Future<Person?> getPerson();

  Future<void> deletePerson();
}

class DataCollectionRepositoryImpl implements DataCollectionRepository {
  final SharedPreferences prefs;

  DataCollectionRepositoryImpl(this.prefs);

  static const _key = 'person';

  @override
  Future<void> savePerson(Person person) async {
    final jsonPerson = person.toRawJson();
    await prefs.setString(_key, jsonPerson);
  }

  @override
  Future<Person?> getPerson() async {
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return null;

    return Person.fromRawJson(jsonString);
  }

  @override
  Future<void> deletePerson() async {
    await prefs.remove(_key);
  }
}
