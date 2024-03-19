import 'package:vangram/core/models/sign_up.dart';

abstract interface class AuthorizationDatasource {
  Future<void> registartion({required SignUpModel signUp});
}
