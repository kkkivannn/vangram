import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/entities/profile/profile_entity.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';

final class GetProfile implements UseCase<ProfileEntity, NoParams> {
  final HomeRepository _homeRepository;

  GetProfile({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, ProfileEntity>> call({required NoParams params}) async {
    return await _homeRepository.getProfile();
  }
}
