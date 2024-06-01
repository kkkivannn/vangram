import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/features/chats/data/datasources/remote/chats_remote_datasource.dart';
import 'package:vangram/features/chats/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/chats/domain/entities/messages/chat_messages_entity.dart';
import 'package:vangram/features/chats/domain/repositories/chats_repository.dart';

final class IChatsRepository implements ChatsRepository {
  final ChatsRemoteDatasource _chatsRemoteDatasource;

  IChatsRepository({required ChatsRemoteDatasource chatsRemoteDatasource})
      : _chatsRemoteDatasource = chatsRemoteDatasource;

  @override
  Future<Either<Failure, List<ChatEntity>>> getUserChats() async {
    try {
      final data = await _chatsRemoteDatasource.getUserChats();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessagesEntity>>> getChatMessages({required int chatId}) async {
    try {
      final data = await _chatsRemoteDatasource.getChatMessages(chatId: chatId);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
