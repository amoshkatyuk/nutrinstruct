import 'package:flutter/material.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/accept_widget.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/custom_circular_loader.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/widgets/deny_widget.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          CustomCircularLoader(),
          AcceptWidget(),
          DenyWidget(),
        ],
      ),
    );
  }
}
