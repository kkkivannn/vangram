import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vangram/core/config/config.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource.dart';
import 'package:vangram/features/authorization/data/models/tokens_model.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';

final class AuthorizationLocalDatasourceImpl implements AuthorizationLocalDatasource {
  final FlutterSecureStorage _storage;

  AuthorizationLocalDatasourceImpl({required FlutterSecureStorage storage}) : _storage = storage;

  @override
  Future<void> saveTokens({required TokensEntity tokens}) async {
    try {
      await _storage.write(key: Config.userTokens, value: jsonEncode(tokens));
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<TokensEntity?> getTokens() async {
    try {
      final tokens = await _storage.read(key: Config.userTokens);
      if (tokens == null || tokens.isEmpty) {
        return null;
      }
      return TokensModel.fromJson(jsonDecode(tokens));
    } catch (error) {
      throw error.toString();
    }
  }

  @override
  Future<void> removeTokens() async {
    try {
      await _storage.delete(key: Config.userTokens);
    } catch (error) {
      throw error.toString();
    }
  }
}
