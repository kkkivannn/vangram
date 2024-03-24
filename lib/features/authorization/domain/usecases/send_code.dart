import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/models/send_code_model.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';

final class SendCode implements UseCase<TokensEntity, SendCodeModel> {
  final AuthorizationRepository _authorizationRepository;

  SendCode({required AuthorizationRepository authorizationRepository})
      : _authorizationRepository = authorizationRepository;

  @override
  Future<Either<Failure, TokensEntity>> call({required SendCodeModel params}) async {
    return await _authorizationRepository.sendCode(sendCodeModel: params);
  }
}
