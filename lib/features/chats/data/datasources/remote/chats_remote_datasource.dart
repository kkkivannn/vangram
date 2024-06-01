import 'package:vangram/features/chats/data/models/chats/chat_model.dart';
import 'package:vangram/features/chats/data/models/messages/chat_messages_model.dart';

abstract interface class ChatsRemoteDatasource {
  Future<List<ChatModel>> getUserChats();

  Future<List<ChatMessagesModel>> getChatMessages({required int chatId});
}
