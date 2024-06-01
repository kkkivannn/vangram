import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vangram/core/constants/endpoints.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource.dart';
import 'package:vangram/features/authorization/data/models/tokens/tokens_model.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';

final class AuthorizationInterceptor extends QueuedInterceptor {
  final AuthorizationLocalDatasource _authorizationLocalDatasource;
  final Dio _dio;

  AuthorizationInterceptor({
    required AuthorizationLocalDatasource authorizationLocalDatasource,
    required Dio dio,
  })  : _authorizationLocalDatasource = authorizationLocalDatasource,
        _dio = dio;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // await _authorizationLocalDatasource.removeTokens();
    final tokens = await _authorizationLocalDatasource.getTokens();
    if (tokens == null) {
      super.onRequest(options, handler);
    } else {
      if (!options.uri.toString().contains('/api/auth/refresh')) {
        final headers = options.headers;
        headers['Authorization'] = 'Bearer ${tokens.accessToken}';
        super.onRequest(options.copyWith(headers: headers), handler);
      } else {
        super.onRequest(options, handler);
      }
    }
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final userTokens = await _authorizationLocalDatasource.getTokens();
        final tokens = await _refreshTokens(tokens: userTokens!);
        if (tokens.accessToken.isNotEmpty && tokens.refreshToken.isNotEmpty) {
          await _authorizationLocalDatasource.saveTokens(tokens: tokens);
          final response = await _dio.fetch(err.requestOptions);
          return handler.resolve(response);
        } else {
          super.onError(err, handler);
        }
      } catch (error) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }

  Future<TokensModel> _refreshTokens({required TokensEntity tokens}) async {
    try {
      final Response response = await _dio.post(
        Endpoints.refreshToken.path,
        data: jsonEncode(
          {
            'refresh_token': tokens.refreshToken,
          },
        ),
      );
      return TokensModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }
}
