import 'package:auto_route/auto_route.dart';
import 'package:nutrinstruct/features/personal_data_collection/presentation/personal_data_collection_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PersonalDataCollectionRoute.page, path: '/'),
  ];
}
