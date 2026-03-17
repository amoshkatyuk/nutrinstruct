import 'package:nutrinstruct/core/data/models/person/person.dart';
import 'package:nutrinstruct/core/use_cases/base_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/data/repositories/data_collection_repository.dart';

class SavePersonUseCase extends BaseUseCase<void, Person> {
  final DataCollectionRepository _dataCollectionRepository;

  SavePersonUseCase(this._dataCollectionRepository);

  @override
  Future<void> implement(Person param) async {
    final result = await _dataCollectionRepository.savePerson(param);
    return result;
  }
}
