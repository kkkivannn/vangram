import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/di/dependency_injection.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/core/constants/config.dart';
import 'package:vangram/features/authorization/presentation/authorization/controller/authorization_bloc.dart';
import 'package:vangram/features/authorization/presentation/authorization/view/authorization_page.dart';
import 'package:vangram/features/authorization/presentation/enter_code/controller/enter_code_bloc.dart';
import 'package:vangram/features/authorization/presentation/enter_code/view/enter_code.dart';
import 'package:vangram/features/authorization/presentation/registration/controller/registration_bloc.dart';
import 'package:vangram/features/authorization/presentation/registration/view/registration_page.dart';
import 'package:vangram/features/authorization/presentation/welcome/view/welcome_page.dart';
import 'package:vangram/features/chats/presentation/chat/controller/chat_bloc.dart';
import 'package:vangram/features/chats/presentation/chat/view/chat.dart';
import 'package:vangram/features/chats/presentation/chats/controller/chats_bloc.dart';
import 'package:vangram/features/chats/presentation/chats/view/chats.dart';
import 'package:vangram/features/chats/presentation/create_new_chat/controller/create_chat_bloc.dart';
import 'package:vangram/features/chats/presentation/create_new_chat/view/create_chat.dart';
import 'package:vangram/features/home/presentation/home/controller/home_bloc.dart';
import 'package:vangram/features/home/presentation/home/view/home_page.dart';
import 'package:vangram/features/posts/presentation/create_new_post/controller/create_new_post_bloc.dart';
import 'package:vangram/features/posts/presentation/create_new_post/view/create_new_post.dart';
import 'package:vangram/features/posts/presentation/posts/controller/posts_cubit.dart';
import 'package:vangram/features/posts/presentation/posts/view/posts.dart';
import 'package:vangram/features/profile/presentation/profile/controller/profile_bloc.dart';
import 'package:vangram/features/profile/presentation/profile/view/profile.dart';
import 'package:vangram/features/settings/presentation/settings/controller/settings_bloc.dart';
import 'package:vangram/features/settings/presentation/settings/view/settings.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

abstract class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/welcome',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) async {
      if (state.location == '/welcome') {
        const storage = FlutterSecureStorage();
        if (await storage.read(key: Config.userTokens) != null) {
          return '/posts';
        }
      }
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BlocProvider(
          create: (context) => HomeBloc(),
          child: HomePage(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/posts',
                name: Routes.posts,
                builder: (context, state) => BlocProvider(
                  create: (context) => PostsCubit(
                    getPosts: DependencyInjection.of(context).getPosts,
                  )..getPosts(),
                  child: const PostsPage(),
                ),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'create_new_post',
                    name: Routes.createNewPost,
                    builder: (context, state) => BlocProvider<PostsCubit>.value(
                      value: state.extra as PostsCubit,
                      child: BlocProvider(
                        create: (context) => CreateNewPostBloc(
                          createPost: DependencyInjection.of(context).createPost,
                        ),
                        child: CreateNewPostPage(
                          key: state.pageKey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.chats,
                path: '/chats',
                builder: (context, state) => BlocProvider(
                  create: (context) => ChatsBloc(
                    getUserChats: DependencyInjection.of(context).getUserChats,
                  )..add(GetChatsEvent()),
                  child: const ChatsPage(),
                ),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'create_chat',
                    name: Routes.createChat,
                    builder: (context, state) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) => CreateChatBloc(),
                        ),
                        BlocProvider.value(value: state.extra as ChatsBloc),
                      ],
                      child: const CreateChatPage(),
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'chat',
                    name: Routes.chat,
                    builder: (context, state) => BlocProvider(
                      create: (context) => ChatBloc(
                        getChatMessages: DependencyInjection.of(context).getChatMessages,
                      )..add(GetMessagesEvent(chatId: state.extra as int)),
                      child: const ChatPage(),
                    ),
                  ),
                ],
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: Routes.profile,
                builder: (context, state) => BlocProvider(
                  create: (context) => ProfileBloc(
                    getProfile: DependencyInjection.of(context).getProfile,
                    getUserPosts: DependencyInjection.of(context).getUserPosts,
                  )..add(GetProfileEvent()),
                  child: const ProfilePage(),
                ),
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.settings,
                path: '/settings',
                builder: (context, state) => BlocProvider(
                  create: (context) => SettingsBloc(),
                  child: const SettingsPage(),
                ),
              )
            ],
          ),
        ],
      ),
      GoRoute(
        path: "/welcome",
        name: Routes.welcome,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: "/registration",
        name: Routes.registration,
        builder: (context, state) => BlocProvider(
          create: (context) => RegistrationBloc(
            signUp: DependencyInjection.of(context).signUp,
          ),
          child: const RegistrationPage(),
        ),
      ),
      GoRoute(
        path: '/authorization',
        name: Routes.authorization,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthorizationBloc(
            sendPhone: DependencyInjection.of(context).sendPhone,
          ),
          child: const AuthorizationPage(),
        ),
      ),
      GoRoute(
        path: '/enter_code',
        name: Routes.enterCode,
        builder: (context, state) => BlocProvider(
          create: (context) => EnterCodeBloc(
            sendCode: DependencyInjection.of(context).sendCode,
          ),
          child: EnterCodePage(
            phone: state.extra as String,
          ),
        ),
      ),
    ],
  );
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
