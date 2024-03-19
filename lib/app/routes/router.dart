import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vangram/app/di/dependency_injection.dart';
import 'package:vangram/app/routes/routes.dart';
import 'package:vangram/features/authorization/presentation/authorization/controller/authorization_bloc.dart';
import 'package:vangram/features/authorization/presentation/welcome/view/welcome_page.dart';


abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/authorizationPage',
    routes: [
      GoRoute(
        path: "/authorizationPage",
        name: Routes.authorizationPage,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthorizationBloc(
            signUp: DependencyInjection.of(context).signUp,
          ),
          child: const WelcomePage(),
        ),
      ),
    ],
  );
}
