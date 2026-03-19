import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/assets/gradients/app_gradients.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final PersonalDataCollectionStatus status;

  const OnboardingProgressIndicator({super.key, required this.status});

  double get _progress => switch (status) {
    PersonalDataCollectionStatus.initial => 0.0,
    PersonalDataCollectionStatus.ageCollecting => 0.2,
    PersonalDataCollectionStatus.genderCollecting => 0.4,
    PersonalDataCollectionStatus.parametersCollecting => 0.6,
    PersonalDataCollectionStatus.activityLevelCollecting => 0.8,
    PersonalDataCollectionStatus.purposeCollecting => 0.9,
    PersonalDataCollectionStatus.resultReady => 1.0,
    _ => 0.0,
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedFractionallySizedBox(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      widthFactor: _progress,
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          gradient: _progress < 1.0
              ? AppGradients.lilacBlue
              : AppGradients.cryLimeGreen,
          borderRadius: .circular(2),
        ),
      ),
    );
  }
}
