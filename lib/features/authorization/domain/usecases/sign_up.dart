import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/sign_up/sign_up.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';

final class SignUp implements UseCase<void, SignUpModel> {
  final AuthorizationRepository _authorizationRepository;

  SignUp({required AuthorizationRepository authorizationRepository})
      : _authorizationRepository = authorizationRepository;

  @override
  Future<Either<Failure, void>> call({required SignUpModel params}) async {
    return await _authorizationRepository.signUp(signUp: params);
  }
}
