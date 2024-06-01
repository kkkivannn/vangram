import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/posts/domain/entities/post/post_entity.dart';
import 'package:vangram/features/posts/domain/repositories/posts_repository.dart';

final class GetUserPosts implements UseCase<List<PostEntity>, NoParams> {
  final PostsRepository _postsRepository;

  GetUserPosts({required PostsRepository postsRepository}) : _postsRepository = postsRepository;

  @override
  Future<Either<Failure, List<PostEntity>>> call({required NoParams params}) async {
    return await _postsRepository.getUserPosts();
  }
}
