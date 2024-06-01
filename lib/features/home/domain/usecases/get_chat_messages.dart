import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/entities/messages/chat_messages_entity.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';

final class GetChatMessages implements UseCase<List<ChatMessagesEntity>, int> {
  final HomeRepository _homeRepository;

  GetChatMessages({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, List<ChatMessagesEntity>>> call({required int params}) async {
    return await _homeRepository.getChatMessages(chatId: params);
  }
}
