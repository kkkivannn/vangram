import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/send_phone_model.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/authorization/domain/repositories/authorization_repository.dart';

final class SendPhone implements UseCase<void, SendPhoneModel> {
  final AuthorizationRepository _authorizationRepository;

  SendPhone({required AuthorizationRepository authorizationRepository})
      : _authorizationRepository = authorizationRepository;

  @override
  Future<Either<Failure, void>> call({required SendPhoneModel params}) async {
    return await _authorizationRepository.sendPhone(sendPhoneModel: params);
  }
}
