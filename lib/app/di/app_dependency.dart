import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vangram/app/runner/app_env.dart';
import 'package:vangram/core/config/config.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/features/authorization/data/datasources/authorization_datasource.dart';
import 'package:vangram/features/authorization/data/datasources/authorization_datasource_impl.dart';
import 'package:vangram/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:vangram/features/authorization/domain/usecases/sign_up.dart';

final class AppDependency {
  late final AppEnv appEnv;
  late final Dio dio;
  late final AuthorizationDatasource authorizationDatasource;
  late final AuthorizationRepository authorizationRepository;
  late final SignUp signUp;

  AppDependency({required this.appEnv});

  Future<void> init({required OnError onError, required OnProgress onProgress}) async {
    try {
      await dotenv.load();
      onProgress("", "");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
    try {
      if (kDebugMode) {
        dio = Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
          ),
        )..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              error: true,
              compact: true,
              maxWidth: 90,
              responseHeader: false,
            ),
          );
      } else {
        dio = Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
          ),
        );
      }
      onProgress("", "");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
    try {
      authorizationDatasource = AuthorizationDatasourceImpl(dio: dio);
      onProgress("", "");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
    try {
      authorizationRepository = AuthorizationRepositoryImpl(authorizationDatasource: authorizationDatasource);
      onProgress("", "");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
    try {
      signUp = SignUp(authorizationRepository: authorizationRepository);
      onProgress("", "");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
  }
}
