import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/create_post/create_post_model.dart';
import 'package:vangram/features/posts/data/datasources/remote/posts_remote_datasource.dart';
import 'package:vangram/features/posts/domain/entities/post/post_entity.dart';
import 'package:vangram/features/posts/domain/repositories/posts_repository.dart';

final class IPostsRepository implements PostsRepository {
  final PostsRemoteDatasource _postsRemoteDatasource;

  IPostsRepository({required PostsRemoteDatasource postsRemoteDatasource})
      : _postsRemoteDatasource = postsRemoteDatasource;
  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final data = await _postsRemoteDatasource.getPosts();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createPost({required CreatePostModel post}) async {
    try {
      final data = await _postsRemoteDatasource.createPost(post: post);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getUserPosts() async {
    try {
      final data = await _postsRemoteDatasource.getUserPosts();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
