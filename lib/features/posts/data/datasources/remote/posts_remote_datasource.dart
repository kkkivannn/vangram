import 'package:dio/dio.dart';
import 'package:vangram/core/constants/endpoints.dart';
import 'package:vangram/core/helpers/models/create_post/create_post_model.dart';
import 'package:vangram/features/posts/data/models/post/post_model.dart';

part 'posts_remote_datasource_impl.dart';

abstract interface class PostsRemoteDatasource {
  Future<List<PostModel>> getPosts();

  Future<void> createPost({required CreatePostModel post});

  Future<List<PostModel>> getUserPosts();
}
