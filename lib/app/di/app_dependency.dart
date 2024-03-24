import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vangram/app/runner/app_env.dart';
import 'package:vangram/core/config/config.dart';
import 'package:vangram/core/config/interceptor.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource_impl.dart';
import 'package:vangram/features/authorization/data/datasources/remote_datasource/authorization_remote_datasource.dart';
import 'package:vangram/features/authorization/data/datasources/remote_datasource/authorization_remote_datasource_impl.dart';
import 'package:vangram/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:vangram/features/authorization/domain/usecases/send_code.dart';
import 'package:vangram/features/authorization/domain/usecases/send_phone.dart';
import 'package:vangram/features/authorization/domain/usecases/sign_up.dart';

final class AppDependency {
  late final AppEnv appEnv;
  late final FlutterSecureStorage storage;
  late final AuthorizationLocalDatasource authorizationLocalDatasource;
  late final Dio dio;
  late final AuthorizationRemoteDatasource authorizationRemoteDatasource;
  late final AuthorizationRepository authorizationRepository;
  late final SignUp signUp;
  late final SendCode sendCode;
  late final SendPhone sendPhone;

  AppDependency({required this.appEnv});

  Future<void> init({required OnError onError, required OnProgress onProgress}) async {
    try {
      await dotenv.load();
      onProgress("Env", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      storage = const FlutterSecureStorage();
      onProgress("FlutterSecureStorage", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      authorizationLocalDatasource = AuthorizationLocalDatasourceImpl(storage: storage);
      onProgress("AuthorizationLocalDatasource", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      if (kDebugMode) {
        dio = Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
          ),
        )
          ..interceptors.add(
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
              responseBody: true,
              error: true,
              compact: true,
              maxWidth: 90,
              responseHeader: false,
            ),
          )
          ..interceptors.add(
            AuthorizationInterceptor(
              authorizationLocalDatasource: authorizationLocalDatasource,
            ),
          );
      } else {
        dio = Dio(
          BaseOptions(
            baseUrl: Config.baseUrl,
          ),
        );
      }

      onProgress("Dio", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      authorizationRemoteDatasource = AuthorizationRemoteDatasourceImpl(dio: dio);
      onProgress("AuthorizationRemoteDatasource", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      authorizationRepository = AuthorizationRepositoryImpl(
        authorizationDatasource: authorizationRemoteDatasource,
        authorizationLocalDatasource: authorizationLocalDatasource,
      );
      onProgress("AuthorizationRepository", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      signUp = SignUp(authorizationRepository: authorizationRepository);
      sendCode = SendCode(authorizationRepository: authorizationRepository);
      sendPhone = SendPhone(authorizationRepository: authorizationRepository);
      onProgress("SignUp", "Success");
      onProgress("SendCode", "Success");
      onProgress("SendPhone", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
  }
}
