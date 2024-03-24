import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/models/send_code_model.dart';
import 'package:vangram/core/models/send_phone_model.dart';
import 'package:vangram/core/models/sign_up.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';

abstract interface class AuthorizationRepository {
  Future<Either<Failure, void>> signUp({required SignUpModel signUp});

  Future<Either<Failure, TokensEntity>> sendCode({required SendCodeModel sendCodeModel});

  Future<Either<Failure, void>> sendPhone({required SendPhoneModel sendPhoneModel});
}
