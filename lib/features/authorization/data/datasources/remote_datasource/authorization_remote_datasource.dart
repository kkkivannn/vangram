import 'package:dio/dio.dart';
import 'package:vangram/core/helpers/models/send_code/send_code_model.dart';
import 'package:vangram/core/helpers/models/send_phone/send_phone_model.dart';
import 'package:vangram/core/helpers/models/sign_up/sign_up.dart';
import 'package:vangram/features/authorization/data/models/tokens/tokens_model.dart';

abstract interface class AuthorizationRemoteDatasource {
  Future<void> registration({required SignUpModel signUp});

  Future<void> sendPhone({required SendPhoneModel sendPhoneModel});

  Future<TokensModel> sendCode({required SendCodeModel sendCodeModel});

  Future<TokensModel> refreshTokens();

  Future<dynamic> fetch({required RequestOptions options});
}
