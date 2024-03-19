import 'package:flutter/material.dart';
import 'package:vangram/app/di/app_dependency.dart';
import 'package:vangram/app/di/dependency_injection.dart';
import 'package:vangram/app/routes/router.dart';
import 'package:vangram/app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key, required this.appDependency});

  final AppDependency appDependency;

  @override
  Widget build(BuildContext context) {
    return DependencyInjection(
      key: const ValueKey("DependencyInjection"),
      appDependency: appDependency,
      child: MaterialApp.router(
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
