import 'package:equatable/equatable.dart';
import 'package:nutrinstruct/core/data/models/model_response/ai_response.dart';
import 'package:nutrinstruct/core/data/models/person/person.dart';

enum PersonalDataCollectionStatus {
  initial,
  ageCollecting,
  genderCollecting,
  parametersCollecting,
  activityLevelCollecting,
  purposeCollecting,
  resultReady,
  dietGenerating,
  dietGeneratingComplete,
  error,
}

class PersonalDataCollectionState extends Equatable {
  final PersonalDataCollectionStatus status;
  final Person? person;
  final AiResponse? aiResponse;
  final String? errorMessage;

  const PersonalDataCollectionState({
    required this.status,
    this.person,
    this.aiResponse,
    this.errorMessage,
  });

  factory PersonalDataCollectionState.initial() =>
      const PersonalDataCollectionState(
        status: PersonalDataCollectionStatus.initial,
      );

  PersonalDataCollectionState copyWith({
    PersonalDataCollectionStatus? status,
    Person? person,
    AiResponse? aiResponse,
    String? errorMessage,
  }) {
    return PersonalDataCollectionState(
      status: status ?? this.status,
      person: person ?? this.person,
      aiResponse: aiResponse ?? this.aiResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, person, aiResponse, errorMessage];
}
