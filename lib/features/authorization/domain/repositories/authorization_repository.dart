import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/models/sign_up.dart';

abstract interface class AuthorizationRepository {
  Future<Either<Failure, void>> signUp({required SignUpModel signUp});
}
