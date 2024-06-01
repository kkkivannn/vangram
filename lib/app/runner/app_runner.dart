import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/app/di/app_dependency.dart';
import 'package:vangram/app/runner/app.dart';
import 'package:vangram/app/runner/app_env.dart';
import 'package:vangram/core/utils/bloc/app_bloc_observer.dart';
import 'package:vangram/core/utils/logger/logger.dart';

final class AppRunner {
  final AppEnv _appEnv;

  AppRunner({required AppEnv appEnv}) : _appEnv = appEnv;

  Future<void> run() async {
    logger.runLogging(
      () => runZonedGuarded(
        () async => await _initApp(),
        (error, stackTrace) => logger.error('Error:', error: error, stackTrace: stackTrace),
      ),
    );
  }

  Future<void> _initApp() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError = logger.logPlatformDispatcherError;
    Bloc.observer = const AppBlocObserver();
    try {
      final appDependency = AppDependency(appEnv: _appEnv);
      await appDependency.init();
      runApp(App(appDependency: appDependency));
    } catch (error, stackTrace) {
      logger.error('Initialization Dependency failed', error: error, stackTrace: stackTrace);
    } finally {
      binding.addPostFrameCallback(
        (timeStamp) {
          binding.allowFirstFrame();
        },
      );
    }
  }
}
