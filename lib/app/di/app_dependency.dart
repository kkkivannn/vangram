import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vangram/app/runner/app_env.dart';
import 'package:vangram/core/constants/config.dart';
import 'package:vangram/core/constants/interceptor.dart';
import 'package:vangram/core/dependency_scope/dependency_scope.dart';
import 'package:vangram/core/utils/logger/logger.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource.dart';
import 'package:vangram/features/authorization/data/datasources/local_datasource/authorization_local_datasource_impl.dart';
import 'package:vangram/features/authorization/data/datasources/remote_datasource/authorization_remote_datasource.dart';
import 'package:vangram/features/authorization/data/datasources/remote_datasource/authorization_remote_datasource_impl.dart';
import 'package:vangram/features/authorization/data/repositories/authorization_repository_impl.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';
import 'package:vangram/features/authorization/domain/usecases/send_code.dart';
import 'package:vangram/features/authorization/domain/usecases/send_phone.dart';
import 'package:vangram/features/authorization/domain/usecases/sign_up.dart';
import 'package:vangram/features/chats/data/datasources/remote/chats_remote_datasource.dart';
import 'package:vangram/features/chats/data/datasources/remote/chats_remote_datasource_impl.dart';
import 'package:vangram/features/chats/data/repositories/chats_repository_impl.dart';
import 'package:vangram/features/chats/domain/repositories/chats_repository.dart';
import 'package:vangram/features/chats/domain/usecases/get_chat_messages.dart';
import 'package:vangram/features/chats/domain/usecases/get_user_chats.dart';
import 'package:vangram/features/posts/data/datasources/remote/posts_remote_datasource.dart';
import 'package:vangram/features/posts/data/repositories/posts_repository_impl.dart';
import 'package:vangram/features/posts/domain/repositories/posts_repository.dart';
import 'package:vangram/features/posts/domain/usecases/create_post.dart';
import 'package:vangram/features/posts/domain/usecases/get_posts.dart';
import 'package:vangram/features/posts/domain/usecases/get_user_posts.dart';
import 'package:vangram/features/profile/data/datasources/remote%20/profile_remote_datasource.dart';
import 'package:vangram/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:vangram/features/profile/domain/repositories/profile_repository.dart';
import 'package:vangram/features/profile/domain/usecases/get_profile.dart';

final class AppDependency extends DependencyScope {
  late final AppEnv appEnv;

  late final FlutterSecureStorage storage;

  late final AuthorizationLocalDatasource authorizationLocalDatasource;

  late final Dio dio;

  late final AuthorizationRemoteDatasource authorizationRemoteDatasource;

  late final ChatsRemoteDatasource chatsRemoteDatasource;

  late final PostsRemoteDatasource postsRemoteDatasource;

  late final ProfileRemoteDatasource profileRemoteDatasource;

  late final AuthorizationRepository authorizationRepository;

  late final ChatsRepository chatsRepository;

  late final PostsRepository postsRepository;

  late final ProfileRepository profileRepository;

  late final SignUp signUp;

  late final SendCode sendCode;

  late final SendPhone sendPhone;

  late final GetPosts getPosts;

  late final GetProfile getProfile;

  late final CreatePost createPost;

  late final GetUserPosts getUserPosts;

  late final GetUserChats getUserChats;

  late final GetChatMessages getChatMessages;

  AppDependency({required this.appEnv});

  Future<void> init() async {
    logger.warning('Initializing dependencies...');
    await _initDependencies();
    logger.warning('Dependencies initialized!');
  }

  Future<void> _initDependencies() async {
    await dotenv.load();

    storage = await create<FlutterSecureStorage>(() => const FlutterSecureStorage());

    authorizationLocalDatasource = await create<AuthorizationLocalDatasource>(
      () => IAuthorizationLocalDatasource(storage: storage),
    );

    dio = await create<Dio>(() => Dio(BaseOptions(baseUrl: Config.baseUrl)));

    dio.interceptors.add(
      AuthorizationInterceptor(
        authorizationLocalDatasource: authorizationLocalDatasource,
        dio: dio,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 120,
          responseHeader: false,
        ),
      );
    }

    authorizationRemoteDatasource = await create<AuthorizationRemoteDatasource>(
      () => IAuthorizationRemoteDatasource(dio: dio),
    );

    chatsRemoteDatasource = await create<ChatsRemoteDatasource>(() => IChatsRemoteDatasource(dio: dio));

    postsRemoteDatasource = await create<PostsRemoteDatasource>(() => IPostsRemoteDatasource(dio: dio));

    profileRemoteDatasource = await create<ProfileRemoteDatasource>(() => IProfileRemoteDatasource(dio: dio));

    authorizationRepository = await create<AuthorizationRepository>(
      () => IAuthorizationRepository(
        authorizationRemoteDatasource: authorizationRemoteDatasource,
        authorizationLocalDatasource: authorizationLocalDatasource,
      ),
    );

    chatsRepository = await create<ChatsRepository>(
      () => IChatsRepository(chatsRemoteDatasource: chatsRemoteDatasource),
    );

    postsRepository = await create<PostsRepository>(
      () => IPostsRepository(postsRemoteDatasource: postsRemoteDatasource),
    );

    profileRepository = await create<ProfileRepository>(
      () => IProfileRepository(profileRemoteDatasource: profileRemoteDatasource),
    );

    signUp = await create<SignUp>(() => SignUp(authorizationRepository: authorizationRepository));

    sendCode = await create<SendCode>(() => SendCode(authorizationRepository: authorizationRepository));

    sendPhone = await create<SendPhone>(() => SendPhone(authorizationRepository: authorizationRepository));

    getPosts = await create<GetPosts>(() => GetPosts(postsRepository: postsRepository));

    getProfile = await create<GetProfile>(() => GetProfile(profileRepository: profileRepository));

    createPost = await create<CreatePost>(() => CreatePost(postsRepository: postsRepository));

    getUserPosts = await create<GetUserPosts>(() => GetUserPosts(postsRepository: postsRepository));

    getUserChats = await create<GetUserChats>(() => GetUserChats(chatsRepository: chatsRepository));

    getChatMessages = await create<GetChatMessages>(() => GetChatMessages(chatsRepository: chatsRepository));
  }
}
