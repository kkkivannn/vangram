import 'package:vangram/core/utils/logger/logger.dart';

abstract base class DependencyScope {
  Future<T> create<T>(T Function() init) async {
    final timer = Stopwatch()..start();
    try {
      return init();
    } catch (error, stackTrace) {
      logger.error('Error init dependency $T:', error: error, stackTrace: stackTrace);
      rethrow;
    } finally {
      timer.stop();
      logger.info("Dependency initialized $T ${timer.elapsedMilliseconds} ms");
    }
  }
}
