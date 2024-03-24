import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';

abstract interface class AuthorizationLocalDatasource {
  Future<void> saveTokens({required TokensEntity tokens});

  Future<TokensEntity?> getTokens();

  Future<void> removeTokens();
}
