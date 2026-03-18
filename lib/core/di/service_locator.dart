import 'package:get_it/get_it.dart';
import 'package:nutrinstruct/features/personal_data_collection/data/repositories/data_collection_repository.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/personal_data_collection/domain/use_cases/delete_person_use_case.dart';
import '../../features/personal_data_collection/domain/use_cases/get_person_use_case.dart';
import '../../features/personal_data_collection/domain/use_cases/save_person_use_case.dart';
import '../config/app_config.dart';

class ServiceLocator {
  final getIt = GetIt.instance;

  Future<void> setupServiceLocator(AppConfig config) async {
    // Config
    getIt.registerSingleton<AppConfig>(config);

    // Shared Preferences
    getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
    );

    //#region Repositories
    getIt.registerLazySingleton<DataCollectionRepository>(
      () => DataCollectionRepositoryImpl(getIt<SharedPreferences>()),
    );

    //#endregion

    //#region Use cases
    getIt.registerLazySingleton(
      () => SavePersonUseCase(getIt<DataCollectionRepository>()),
    );
    getIt.registerLazySingleton(
      () => GetPersonUseCase(getIt<DataCollectionRepository>()),
    );
    getIt.registerLazySingleton(
      () => DeletePersonUseCase(getIt<DataCollectionRepository>()),
    );
    //#endregion

    //#redion Cubits
    getIt.registerFactory(
      () => PersonalDataCollectionCubit(
        savePersonUseCase: getIt<SavePersonUseCase>(),
        getPersonUseCase: getIt<GetPersonUseCase>(),
        deletePersonUseCase: getIt<DeletePersonUseCase>(),
      ),
    );
    //#endregion

    // Ждем инициализацию
    await getIt.allReady();
  }
}
