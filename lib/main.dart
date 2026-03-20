import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutrinstruct/core/config/env_loader.dart';
import 'package:nutrinstruct/core/di/service_locator.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/cubit/personal_data_collection_cubit.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/generate_diet_use_case.dart';
import 'package:nutrinstruct/features/personal_data_collection/domain/use_cases/save_person_use_case.dart';
import 'package:nutrinstruct/router/router.dart';

import 'features/personal_data_collection/domain/use_cases/delete_person_use_case.dart';
import 'features/personal_data_collection/domain/use_cases/get_person_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final serviceLocator = ServiceLocator();
  final config = await EnvLoader.load();
  log('Loaded api_key: ${config.apiKey}');
  await serviceLocator.setupServiceLocator(config);

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
  final _appRouter = AppRouter();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonalDataCollectionCubit>(
          create: (context) => PersonalDataCollectionCubit(
            savePersonUseCase: GetIt.I<SavePersonUseCase>(),
            getPersonUseCase: GetIt.I<GetPersonUseCase>(),
            deletePersonUseCase: GetIt.I<DeletePersonUseCase>(),
            generateDietUseCase: GetIt.I<GenerateDietUseCase>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [AutoRouteObserver()],
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
