import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';

final class GetUserPosts implements UseCase<List<PostEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetUserPosts({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<PostEntity>>> call({required NoParams params}) async {
    return await _homeRepository.getUserPosts();
  }
}
