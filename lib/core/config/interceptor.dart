import 'package:dio/dio.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource.dart';

final class AuthorizationInterceptor extends QueuedInterceptor {
  final AuthorizationLocalDatasource _authorizationLocalDatasource;

  AuthorizationInterceptor({required AuthorizationLocalDatasource authorizationLocalDatasource})
      : _authorizationLocalDatasource = authorizationLocalDatasource;

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
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}
