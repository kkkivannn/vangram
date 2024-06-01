import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/features/chats/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/chats/domain/entities/messages/chat_messages_entity.dart';

abstract interface class ChatsRepository {
  Future<Either<Failure, List<ChatEntity>>> getUserChats();

  Future<Either<Failure, List<ChatMessagesEntity>>> getChatMessages({required int chatId});
}
