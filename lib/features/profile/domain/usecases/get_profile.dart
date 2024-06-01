import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/profile/domain/entities/profile/profile_entity.dart';
import 'package:vangram/features/profile/domain/repositories/profile_repository.dart';

final class GetProfile implements UseCase<ProfileEntity, NoParams> {
  final ProfileRepository _profileRepository;

  GetProfile({required ProfileRepository profileRepository}) : _profileRepository = profileRepository;

  @override
  Future<Either<Failure, ProfileEntity>> call({required NoParams params}) async {
    return await _profileRepository.getProfile();
  }
}
