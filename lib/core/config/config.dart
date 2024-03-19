import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Config {
  static String get baseUrl => dotenv.env["BASE_URL"] ?? '';
}
