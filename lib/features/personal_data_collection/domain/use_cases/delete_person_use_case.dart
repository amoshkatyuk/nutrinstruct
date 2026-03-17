import 'package:nutrinstruct/core/use_cases/base_no_params_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/data/repositories/data_collection_repository.dart';

class DeletePersonUseCase extends BaseNoParamsUseCase<void> {
  final DataCollectionRepository _dataCollectionRepository;

  DeletePersonUseCase(this._dataCollectionRepository);

  @override
  Future<void> implement() async {
    return await _dataCollectionRepository.deletePerson();
  }
}
