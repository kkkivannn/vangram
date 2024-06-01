part of 'posts_remote_datasource.dart';

final class IPostsRemoteDatasource implements PostsRemoteDatasource {
  final Dio _dio;

  IPostsRemoteDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final Response response = await _dio.get(Endpoints.posts.path);
      return List.from(
        (response.data as List<dynamic>)
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList(),
      );
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<void> createPost({required CreatePostModel post}) async {
    try {
      FormData data = FormData.fromMap(await post.toJson());
      await _dio.post(Endpoints.post.path, data: data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<List<PostModel>> getUserPosts() async {
    try {
      final response = await _dio.get(Endpoints.userPosts.path);
      return List.from(
        (response.data as List<dynamic>)
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return error.response?.data;
    }
  }
}
