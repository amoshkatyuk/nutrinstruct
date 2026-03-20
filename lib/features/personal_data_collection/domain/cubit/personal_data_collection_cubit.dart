import 'package:bloc/bloc.dart';
import 'package:nutrinstruct/core/data/enums/activity_level.dart';
import 'package:nutrinstruct/core/data/enums/gender.dart';
import 'package:nutrinstruct/core/data/enums/purposes.dart';
import 'package:nutrinstruct/core/data/models/parameters/parameters.dart';
import 'package:nutrinstruct/core/utils/validators/age_validator.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/delete_person_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/generate_diet_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/get_person_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/save_person_use_case.dart';

import '../../../../core/data/models/person/person.dart';
import '../../../../core/utils/validators/parameters_validator.dart';

class PersonalDataCollectionCubit extends Cubit<PersonalDataCollectionState> {
  final SavePersonUseCase _savePersonUseCase;
  final GetPersonUseCase _getPersonUseCase;
  final DeletePersonUseCase _deletePersonUseCase;
  final GenerateDietUseCase _generateDietUseCase;

  PersonalDataCollectionCubit({
    required SavePersonUseCase savePersonUseCase,
    required GetPersonUseCase getPersonUseCase,
    required DeletePersonUseCase deletePersonUseCase,
    required GenerateDietUseCase generateDietUseCase,
  }) : _savePersonUseCase = savePersonUseCase,
       _getPersonUseCase = getPersonUseCase,
       _deletePersonUseCase = deletePersonUseCase,
       _generateDietUseCase = generateDietUseCase,
       super(PersonalDataCollectionState.initial());

  Future<void> init() async {
    final person = await _getPersonUseCase.execute();

    if (person.data != null) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.resultReady,
          person: person.data,
        ),
      );
    }
  }

  void start() {
    emit(state.copyWith(status: PersonalDataCollectionStatus.ageCollecting));
  }

  void previousStep() {
    final previous = switch (state.status) {
      PersonalDataCollectionStatus.ageCollecting =>
        PersonalDataCollectionStatus.initial,
      PersonalDataCollectionStatus.genderCollecting =>
        PersonalDataCollectionStatus.ageCollecting,
      PersonalDataCollectionStatus.parametersCollecting =>
        PersonalDataCollectionStatus.genderCollecting,
      PersonalDataCollectionStatus.activityLevelCollecting =>
        PersonalDataCollectionStatus.parametersCollecting,
      PersonalDataCollectionStatus.purposeCollecting =>
        PersonalDataCollectionStatus.activityLevelCollecting,
      _ => state.status,
    };
    emit(state.copyWith(status: previous));
  }

  void setAge(int? age) {
    final error = AgeValidator.validate(age);

    if (error != null) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: error,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(age: age),
        status: PersonalDataCollectionStatus.genderCollecting,
      ),
    );
  }

  void selectGender(Gender gender) {
    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(gender: gender),
      ),
    );
  }

  void setGender(Gender gender) {
    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(gender: gender),
        status: PersonalDataCollectionStatus.parametersCollecting,
      ),
    );
  }

  void setParameters(Parameters parameters) {
    final error = ParametersValidator.validate(parameters);

    if (error != null) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: error,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(
          parameters: parameters,
        ),
        status: PersonalDataCollectionStatus.activityLevelCollecting,
      ),
    );
  }

  void selectActivityLevel(ActivityLevel activityLevel) {
    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(
          activityLevel: activityLevel,
        ),
      ),
    );
  }

  void setActivityLevel(ActivityLevel activityLevel) {
    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(
          activityLevel: activityLevel,
        ),
        status: PersonalDataCollectionStatus.purposeCollecting,
      ),
    );
  }

  void selectPurpose(Purposes purpose) {
    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(purpose: purpose),
      ),
    );
  }

  void setPurpose(Purposes purpose) {
    emit(
      state.copyWith(
        person: (state.person ?? const Person()).copyWith(purpose: purpose),
        status: PersonalDataCollectionStatus.resultReady,
      ),
    );
    generateDiet();
  }

  Future<void> generateDiet() async {
    final person = state.person;
    if (person == null) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: 'Person is null',
        ),
      );
      return;
    }

    try {
      emit(state.copyWith(status: PersonalDataCollectionStatus.dietGenerating));

      final aiResponse = await _generateDietUseCase.execute(person);

      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.dietGeneratingComplete,
          aiResponse: aiResponse.data,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> save() async {
    final person = state.person;
    if (person == null) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: 'Person is null',
        ),
      );
      return;
    }

    try {
      await _savePersonUseCase.execute(person);
    } catch (e) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> delete() async {
    try {
      await _deletePersonUseCase.execute();
      emit(PersonalDataCollectionState.initial());
    } catch (e) {
      emit(
        state.copyWith(
          status: PersonalDataCollectionStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
