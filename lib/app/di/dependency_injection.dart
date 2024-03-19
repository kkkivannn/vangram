import 'package:flutter/cupertino.dart';
import 'package:vangram/app/di/app_dependency.dart';

final class DependencyInjection extends InheritedWidget {
  final AppDependency appDependency;

  const DependencyInjection({super.key, required super.child, required this.appDependency});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDependency of(BuildContext context) {
    final di = context.dependOnInheritedWidgetOfExactType<DependencyInjection>();
    assert(di == null, "Dependency not found");
    return di!.appDependency;
  }
}
