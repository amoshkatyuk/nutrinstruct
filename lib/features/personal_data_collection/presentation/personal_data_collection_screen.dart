import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/activity_level_step_placeholder.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/age_step_placeholder.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/gender_step_placeholder.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/initial_step_placeholder.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/parameters_step_placeholder.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/purpose_step_placeholder.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/placeholders/result_ready_placeholder.dart';

@RoutePage()
class PersonalDataCollectionScreen extends StatefulWidget {
  const PersonalDataCollectionScreen({super.key});

  @override
  State<PersonalDataCollectionScreen> createState() =>
      _PersonalDataCollectionScreenState();
}

class _PersonalDataCollectionScreenState
    extends State<PersonalDataCollectionScreen> {
  final _pageController = PageController();

  static const _pages = [
    InitialStepPlaceholder(),
    AgeStepPlaceholder(),
    GenderStepPlaceholder(),
    ParametersStepPlaceholder(),
    ActivityLevelStepPlaceholder(),
    PurposeStepPlaceholder(),
    ResultReadyPlaceholder(),
  ];

  int _statusToIndex(PersonalDataCollectionStatus status) {
    return switch (status) {
      PersonalDataCollectionStatus.initial => 0,
      PersonalDataCollectionStatus.ageCollecting => 1,
      PersonalDataCollectionStatus.genderCollecting => 2,
      PersonalDataCollectionStatus.parametersCollecting => 3,
      PersonalDataCollectionStatus.activityLevelCollecting => 4,
      PersonalDataCollectionStatus.purposeCollecting => 5,
      PersonalDataCollectionStatus.resultReady => 6,
      _ => 0,
    };
  }

  void _animateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<PersonalDataCollectionCubit>()..init(),
      child:
          BlocConsumer<
            PersonalDataCollectionCubit,
            PersonalDataCollectionState
          >(
            listener: (context, state) {
              if (state.status == PersonalDataCollectionStatus.resultReady) {
                _animateToPage(_statusToIndex(state.status));
              }

              _animateToPage(_statusToIndex(state.status));
            },
            builder: (context, state) {
              return Scaffold(
                body: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _pages,
                ),
              );
            },
          ),
    );
  }
}
