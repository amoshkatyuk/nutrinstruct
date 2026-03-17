import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../error/data_error.dart';
import 'app_config.dart';

class EnvLoader {
  static Future<AppConfig> load() async {
    await dotenv.load();

    final apiKey = dotenv.env['API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw DataError(message: 'BASE_URL не определен в .env');
    }

    return AppConfig(apiKey: apiKey);
  }
}
