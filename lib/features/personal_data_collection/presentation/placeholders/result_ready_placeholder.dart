import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrinstruct/core/assets/app_text_styles/app_text_styles.dart';
import 'package:nutrinstruct/core/constants/app_strings.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_state.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/ellipsis.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/person_info_card.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/result_ready_icon.dart';

class ResultReadyPlaceholder extends StatelessWidget {
  const ResultReadyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      PersonalDataCollectionCubit,
      PersonalDataCollectionState
    >(
      builder: (context, state) {
        final person = state.person;

        return SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              left: 16,
              top: 20,
              right: 16,
              bottom: 20,
            ),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                ResultReadyIcon(),

                const SizedBox(height: 26),

                Text(
                  AppStrings.readyTitle,
                  style: AppTextStyles.headerDark,
                  textAlign: .center,
                ),

                const SizedBox(height: 26),

                Text(
                  AppStrings.readySubtitle,
                  style: AppTextStyles.bodyLight,
                  textAlign: .center,
                ),

                const SizedBox(height: 26),

                Ellipsis(),

                const SizedBox(height: 26),

                PersonInfoCard(person: person!),
              ],
            ),
          ),
        );
      },
    );
  }
}
