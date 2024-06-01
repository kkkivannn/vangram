import 'package:dio/dio.dart';
import 'package:vangram/core/constants/endpoints.dart';
import 'package:vangram/core/helpers/models/send_code_model.dart';
import 'package:vangram/core/helpers/models/send_phone_model.dart';
import 'package:vangram/core/helpers/models/sign_up.dart';
import 'package:vangram/features/authorization/data/datasources/remote_datasource/authorization_remote_datasource.dart';
import 'package:vangram/features/authorization/data/models/tokens/tokens_model.dart';

final class AuthorizationRemoteDatasourceImpl implements AuthorizationRemoteDatasource {
  final Dio _dio;

  AuthorizationRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<void> registration({required SignUpModel signUp}) async {
    try {
      FormData dataWithOutPhoto;
      FormData data;
      if (signUp.photo == null) {
        dataWithOutPhoto = FormData.fromMap(signUp.signUpToJson());
        await _dio.patch(Endpoints.user.path, data: dataWithOutPhoto);
      } else {
        data = FormData.fromMap(signUp.toJson());
        await _dio.patch(Endpoints.user.path, data: data);
      }
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<TokensModel> sendCode({required SendCodeModel sendCodeModel}) async {
    try {
      final Response response = await _dio.post(Endpoints.sendCode.path, data: sendCodeModel.toJson());
      return TokensModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<void> sendPhone({required SendPhoneModel sendPhoneModel}) async {
    try {
      await _dio.post(Endpoints.sendNumber.path, data: sendPhoneModel.toJson());
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future fetch({required RequestOptions options}) async {
    try {
      return await _dio.fetch(options);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokensModel> refreshTokens() async {
    try {
      final Response response = await _dio.post(Endpoints.refreshToken.path);
      return TokensModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }
}
