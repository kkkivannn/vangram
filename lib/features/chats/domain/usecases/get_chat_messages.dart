import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/chats/domain/entities/messages/chat_messages_entity.dart';
import 'package:vangram/features/chats/domain/repositories/chats_repository.dart';

final class GetChatMessages implements UseCase<List<ChatMessagesEntity>, int> {
  final ChatsRepository _chatsRepository;

  GetChatMessages({required ChatsRepository chatsRepository}) : _chatsRepository = chatsRepository;

  @override
  Future<Either<Failure, List<ChatMessagesEntity>>> call({required int params}) async {
    return await _chatsRepository.getChatMessages(chatId: params);
  }
}
