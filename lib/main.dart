import 'package:flutter/material.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/gradient_button.dart';
import 'package:nutrinstruct/features/shared/presentation/buttons/navigation_button.dart';
import 'package:nutrinstruct/features/shared/presentation/text_fields/data_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                NavigationButton.square(
                  size: 70,
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: () {},
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: GradientButton(
                    height: 70,
                    title: 'Далее',
                    icon: Icons.arrow_forward_ios_rounded,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),

          NavigationButton(
            width: 70,
            height: 70,
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {},
          ),

          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: DataTextField(controller: controller, hint: 'Дата рождения'),
          ),
        ],
      ),
    );
  }
}
