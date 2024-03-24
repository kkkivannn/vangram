import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/di/dependency_injection.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/features/authorization/presentation/authorization/controller/authorization_bloc.dart';
import 'package:vangram/features/authorization/presentation/authorization/view/authorization_page.dart';
import 'package:vangram/features/authorization/presentation/enter_code/controller/enter_code_bloc.dart';
import 'package:vangram/features/authorization/presentation/enter_code/view/enter_code.dart';
import 'package:vangram/features/authorization/presentation/registration/controller/registration_bloc.dart';
import 'package:vangram/features/authorization/presentation/registration/view/registration_page.dart';
import 'package:vangram/features/authorization/presentation/welcome/view/welcome_page.dart';
import 'package:vangram/features/home/presentation/view/home_page.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/welcome',
    routes: [
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
      GoRoute(
        path: '/home',
        name: Routes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
