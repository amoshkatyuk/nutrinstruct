import 'package:genkit/genkit.dart';
import 'package:genkit_google_genai/genkit_google_genai.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrinstruct/core/config/app_config.dart';
import 'package:nutrinstruct/core/utils/services/ai_service.dart';
import 'package:nutrinstruct/features/personal_data_collection/data/repositories/data_collection_repository.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/generate_diet_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/personal_data_collection/domain/use_cases/delete_person_use_case.dart';
import '../../features/personal_data_collection/domain/use_cases/get_person_use_case.dart';
import '../../features/personal_data_collection/domain/use_cases/save_person_use_case.dart';
import '../utils/prompt_builders/prompt_builder.dart';

class ServiceLocator {
  final getIt = GetIt.instance;

  Future<void> setupServiceLocator(AppConfig config) async {
    // Config
    getIt.registerSingleton<AppConfig>(config);

    // Shared Preferences
    getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance(),
    );

    // Genkit
    getIt.registerLazySingleton<Genkit>(() {
      final config = getIt<AppConfig>();

      return Genkit(plugins: [googleAI(apiKey: config.apiKey)]);
    });

    //#region PromptBuilders
    getIt.registerLazySingleton<PromptBuilder>(() => PromptBuilderImpl());

    //#endregion

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
    getIt.registerLazySingleton(
      () => GenerateDietUseCase(
        promptBuilder: getIt<PromptBuilder>(),
        aiService: getIt<AiService>(),
      ),
    );
    //#endregion

    //#redion Cubits
    getIt.registerFactory(
      () => PersonalDataCollectionCubit(
        savePersonUseCase: getIt<SavePersonUseCase>(),
        getPersonUseCase: getIt<GetPersonUseCase>(),
        deletePersonUseCase: getIt<DeletePersonUseCase>(),
        generateDietUseCase: getIt<GenerateDietUseCase>(),
      ),
    );
    //#endregion

    //#redion Services
    getIt.registerLazySingleton<AiService>(
      () => AiServiceImpl(getIt<Genkit>()),
    );
    //#endregion

    // Ждем инициализацию
    await getIt.allReady();
  }
}
