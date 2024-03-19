import 'package:dio/dio.dart';
import 'package:vangram/core/config/endpoints.dart';
import 'package:vangram/core/models/sign_up.dart';
import 'package:vangram/features/authorization/data/datasources/authorization_datasource.dart';

final class AuthorizationDatasourceImpl implements AuthorizationDatasource {
  final Dio _dio;

  AuthorizationDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> registartion({required SignUpModel signUp}) async {
    try {
      FormData data = FormData.fromMap(signUp.toJson());
      await _dio.post(Endpoints.signUp.path, data: data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }
}
