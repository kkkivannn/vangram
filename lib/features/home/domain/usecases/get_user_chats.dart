import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';

final class GetUserChats implements UseCase<List<ChatEntity>, NoParams> {
  final HomeRepository _homeRepository;

  GetUserChats({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<ChatEntity>>> call({required NoParams params}) async {
    return await _homeRepository.getUserChats();
  }
}
