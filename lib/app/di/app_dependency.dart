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
import 'package:vangram/features/home/data/datasources/remote_datasource/home_remote_datasource.dart';
import 'package:vangram/features/home/data/datasources/remote_datasource/home_remote_datasource_impl.dart';
import 'package:vangram/features/home/data/repositories/home_repository_impl.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';
import 'package:vangram/features/home/domain/usecases/create_post.dart';
import 'package:vangram/features/home/domain/usecases/get_posts.dart';
import 'package:vangram/features/home/domain/usecases/get_profile.dart';
import 'package:vangram/features/home/domain/usecases/get_user_posts.dart';

final class AppDependency {
  late final AppEnv appEnv;
  late final FlutterSecureStorage storage;
  late final AuthorizationLocalDatasource authorizationLocalDatasource;
  late final Dio dio;
  late final AuthorizationRemoteDatasource authorizationRemoteDatasource;
  late final HomeRemoteDatasource homeRemoteDatasource;
  late final AuthorizationRepository authorizationRepository;
  late final HomeRepository homeRepository;
  late final SignUp signUp;
  late final SendCode sendCode;
  late final SendPhone sendPhone;
  late final GetPosts getPosts;
  late final GetProfile getProfile;
  late final CreatePost createPost;
  late final GetUserPosts getUserPosts;

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
        dio.interceptors.add(
          AuthorizationInterceptor(
            authorizationLocalDatasource: authorizationLocalDatasource,
            dio: dio,
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
      homeRemoteDatasource = HomeRemoteDatasourceImpl(dio: dio);
      onProgress("AuthorizationRemoteDatasource", "Success");
      onProgress("HomeRemoteDatasource", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      authorizationRepository = AuthorizationRepositoryImpl(
        authorizationDatasource: authorizationRemoteDatasource,
        authorizationLocalDatasource: authorizationLocalDatasource,
      );
      homeRepository = HomeRepositoryImpl(homeRemoteDatasource: homeRemoteDatasource);
      onProgress("AuthorizationRepository", "Success");
      onProgress("HomeRepository", "Success");
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }

    try {
      signUp = SignUp(authorizationRepository: authorizationRepository);
      sendCode = SendCode(authorizationRepository: authorizationRepository);
      sendPhone = SendPhone(authorizationRepository: authorizationRepository);
      getPosts = GetPosts(homeRepository: homeRepository);
      getProfile = GetProfile(homeRepository: homeRepository);
      createPost = CreatePost(homeRepository: homeRepository);
      getUserPosts = GetUserPosts(homeRepository: homeRepository);
      onProgress("SignUp", "Success");
      onProgress("SendCode", "Success");
      onProgress("SendPhone", "Success");
      onProgress("getPosts", "Success");
      onProgress("getProfile", "Success");
      onProgress("createPost", "Success");
      onProgress('getUserPosts', 'Success');
    } on Object catch (error, stackTrace) {
      onError('error', error, stackTrace);
    }
  }
}
