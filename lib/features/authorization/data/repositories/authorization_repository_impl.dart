import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/send_code_model.dart';
import 'package:vangram/core/helpers/models/send_phone_model.dart';
import 'package:vangram/core/helpers/models/sign_up.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource.dart';
import 'package:vangram/features/authorization/data/datasources/remote_datasource/authorization_remote_datasource.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';

final class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationRemoteDatasource _authorizationDatasource;
  final AuthorizationLocalDatasource _authorizationLocalDatasource;

  AuthorizationRepositoryImpl({
    required AuthorizationRemoteDatasource authorizationDatasource,
    required AuthorizationLocalDatasource authorizationLocalDatasource,
  })  : _authorizationDatasource = authorizationDatasource,
        _authorizationLocalDatasource = authorizationLocalDatasource;

  @override
  Future<Either<Failure, void>> signUp({required SignUpModel signUp}) async {
    try {
      final data = _authorizationDatasource.registration(signUp: signUp);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, TokensEntity>> sendCode({required SendCodeModel sendCodeModel}) async {
    try {
      final data = await _authorizationDatasource.sendCode(sendCodeModel: sendCodeModel);
      try {
        await _authorizationLocalDatasource.saveTokens(tokens: data);
      } catch (error) {
        return Left(CachedFailure(message: error.toString()));
      }
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPhone({required SendPhoneModel sendPhoneModel}) async {
    try {
      final data = await _authorizationDatasource.sendPhone(sendPhoneModel: sendPhoneModel);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, TokensEntity>> refreshToken() async {
    try {
      final data = await _authorizationDatasource.refreshTokens();
      try {
        await _authorizationLocalDatasource.saveTokens(tokens: data);
      } catch (error) {
        return Left(CachedFailure(message: error.toString()));
      }
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
