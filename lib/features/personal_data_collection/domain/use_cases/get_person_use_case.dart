import 'package:nutrinstruct/core/use_cases/base_no_params_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/data/repositories/data_collection_repository.dart';

import '../../../../core/data/models/person/person.dart';

class GetPersonUseCase extends BaseNoParamsUseCase<Person?> {
  final DataCollectionRepository _dataCollectionRepository;

  GetPersonUseCase(this._dataCollectionRepository);

  @override
  Future<Person?> implement() async {
    final result = await _dataCollectionRepository.getPerson();
    return result;
  }
}
