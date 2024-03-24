import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vangram/app/di/app_dependency.dart';
import 'package:vangram/app/runner/app.dart';
import 'package:vangram/app/runner/app_env.dart';

final class AppRunner {
  final AppEnv _appEnv;

  AppRunner({required AppEnv appEnv}) : _appEnv = appEnv;

  Future<void> run() async {
    runZonedGuarded(
      () async {
        await _initApp();
        final appDependency = AppDependency(appEnv: _appEnv);
        await appDependency.init(
          onError: (error, name, stackTrace) {
            throw "$error, $name, $stackTrace";
          },
          onProgress: (name, progress) {
            log("$name: $progress");
          },
        );
        runApp(App(appDependency: appDependency));
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          WidgetsBinding.instance.allowFirstFrame();
        });
      },
      (error, stack) => log(error.toString(), stackTrace: stack, error: error),
    );
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}
