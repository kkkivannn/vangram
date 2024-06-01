import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Config {
  static String get baseUrl => dotenv.env["BASE_URL"] ?? '';

  static String get userTokens => dotenv.env['USER_TOKENS'] ?? '';

  static String get wssBaseUrl => dotenv.env['BASE_URL_WSS'] ?? '';
}
