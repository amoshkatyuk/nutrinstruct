import 'package:flutter/material.dart';
import 'package:nutrinstruct/core/data/models/person/person.dart';
import 'package:nutrinstruct/features/shared/presentation/cards/app_card.dart';

class PersonInfoCard extends StatelessWidget {
  final Person person;

  const PersonInfoCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        children: [
          Row(children: [Text('Возраст'), Text(person.age.toString())]),
          Row(children: [Text('Пол'), Text(person.gender.toString())]),
          Row(
            children: [
              Text('Параметры'),
              Text(
                '${person.parameters!.height.toString()} см / ${person.parameters!.weight.toString()} кг',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
