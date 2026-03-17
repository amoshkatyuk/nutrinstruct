import 'package:equatable/equatable.dart';
import 'package:nutrinstruct/core/data/models/person/person.dart';

enum PersonalDataCollectionStatus {
  ageCollecting,
  genderCollecting,
  parametersCollecting,
  activityLevelCollecting,
  purposeCollecting,
  resultReady,
  error,
}

class PersonalDataCollectionState extends Equatable {
  final PersonalDataCollectionStatus status;
  final Person? person;
  final String? errorMessage;

  const PersonalDataCollectionState({
    required this.status,
    this.person,
    this.errorMessage,
  });

  factory PersonalDataCollectionState.initial() =>
      const PersonalDataCollectionState(
        status: PersonalDataCollectionStatus.genderCollecting,
      );

  PersonalDataCollectionState copyWith({
    PersonalDataCollectionStatus? status,
    Person? person,
    String? errorMessage,
  }) {
    return PersonalDataCollectionState(
      status: status ?? this.status,
      person: person ?? this.person,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, person, errorMessage];
}
