typedef OnError = void Function(String name, Object error, StackTrace? stackTrace);
typedef OnProgress = void Function(String name, String progress);

final class Failure {}

final class ServerFailure extends Failure {
  final String error;

  ServerFailure({required this.error});
}
