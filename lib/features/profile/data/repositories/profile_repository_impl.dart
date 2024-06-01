import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/features/profile/data/datasources/remote%20/profile_remote_datasource.dart';
import 'package:vangram/features/profile/domain/entities/profile/profile_entity.dart';
import 'package:vangram/features/profile/domain/repositories/profile_repository.dart';

final class IProfileRepository implements ProfileRepository {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  IProfileRepository({required ProfileRemoteDatasource profileRemoteDatasource})
      : _profileRemoteDatasource = profileRemoteDatasource;

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final data = await _profileRemoteDatasource.getProfile();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
