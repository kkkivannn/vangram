import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';

final class RefreshTokens implements UseCase<TokensEntity, NoParams> {
  final AuthorizationRepository _authorizationRepository;

  RefreshTokens({required AuthorizationRepository authorizationRepository})
      : _authorizationRepository = authorizationRepository;

  @override
  Future<Either<Failure, TokensEntity>> call({required NoParams params}) async {
    return await _authorizationRepository.refreshToken();
  }
}
