import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/create_post/create_post_model.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/posts/domain/repositories/posts_repository.dart';

final class CreatePost implements UseCase<void, CreatePostModel> {
  final PostsRepository _postsRepository;

  CreatePost({required PostsRepository postsRepository}) : _postsRepository = postsRepository;

  @override
  Future<Either<Failure, void>> call({required CreatePostModel params}) async {
    return await _postsRepository.createPost(post: params);
  }
}
