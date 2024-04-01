import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/di/dependency_injection.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/core/config/config.dart';
import 'package:vangram/features/authorization/presentation/authorization/controller/authorization_bloc.dart';
import 'package:vangram/features/authorization/presentation/authorization/view/authorization_page.dart';
import 'package:vangram/features/authorization/presentation/enter_code/controller/enter_code_bloc.dart';
import 'package:vangram/features/authorization/presentation/enter_code/view/enter_code.dart';
import 'package:vangram/features/authorization/presentation/registration/controller/registration_bloc.dart';
import 'package:vangram/features/authorization/presentation/registration/view/registration_page.dart';
import 'package:vangram/features/authorization/presentation/welcome/view/welcome_page.dart';
import 'package:vangram/features/home/presentation/chats/controller/chats_bloc.dart';
import 'package:vangram/features/home/presentation/chats/view/chats.dart';
import 'package:vangram/features/home/presentation/home/controller/home_bloc.dart';
import 'package:vangram/features/home/presentation/home/view/home_page.dart';
import 'package:vangram/features/home/presentation/posts/controller/posts_cubit.dart';
import 'package:vangram/features/home/presentation/posts/view/posts.dart';
import 'package:vangram/features/home/presentation/profile/controller/profile_bloc.dart';
import 'package:vangram/features/home/presentation/profile/view/profile.dart';
import 'package:vangram/features/home/presentation/settings/controller/settings_bloc.dart';
import 'package:vangram/features/home/presentation/settings/view/settings.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/welcome',
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
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: Routes.chats,
                path: '/chats',
                builder: (context, state) => BlocProvider(
                  create: (context) => ChatsBloc(),
                  child: const ChatsPage(),
                ),
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
