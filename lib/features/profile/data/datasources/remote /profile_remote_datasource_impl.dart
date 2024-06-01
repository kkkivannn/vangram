part of 'profile_remote_datasource.dart';

final class IProfileRemoteDatasource implements ProfileRemoteDatasource {
  final Dio _dio;

  IProfileRemoteDatasource({required Dio dio}) : _dio = dio;

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final Response response = await _dio.get(Endpoints.profile.path);
      return ProfileModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }
}
