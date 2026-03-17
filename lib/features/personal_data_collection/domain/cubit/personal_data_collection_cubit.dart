import 'package:bloc/bloc.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';

class PersonalDataCollectionCubit extends Cubit<PersonalDataCollectionState> {
  PersonalDataCollectionCubit() : super(PersonalDataCollectionState.initial());
}
