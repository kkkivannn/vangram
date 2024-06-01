import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}

final class NoParams {}
