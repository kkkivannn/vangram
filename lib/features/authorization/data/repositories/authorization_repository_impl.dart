import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/models/sign_up.dart';
import 'package:vangram/features/authorization/data/datasources/authorization_datasource.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';

final class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationDatasource _authorizationDatasource;

  AuthorizationRepositoryImpl({required AuthorizationDatasource authorizationDatasource})
      : _authorizationDatasource = authorizationDatasource;
  @override
  Future<Either<Failure, void>> signUp({required SignUpModel signUp}) async {
    try {
      final data = _authorizationDatasource.registartion(signUp: signUp);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(error: error.toString()));
    }
  }
}
