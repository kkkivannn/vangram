import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/models/sign_up.dart';
import 'package:vangram/core/usecase/usecase.dart';
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
