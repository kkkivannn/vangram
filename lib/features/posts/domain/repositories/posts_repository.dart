import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/create_post/create_post_model.dart';
import 'package:vangram/features/posts/domain/entities/post/post_entity.dart';

abstract interface class PostsRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();

  Future<Either<Failure, void>> createPost({required CreatePostModel post});

  Future<Either<Failure, List<PostEntity>>> getUserPosts();
}
