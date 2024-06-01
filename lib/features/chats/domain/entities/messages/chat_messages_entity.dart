import 'package:vangram/features/chats/domain/entities/messages/message_entity.dart';
import 'package:vangram/features/chats/domain/entities/messages/user_message_entity.dart';

base class ChatMessagesEntity {
  final MessageEntity message;
  final UserMessageEntity user;

  ChatMessagesEntity({
    required this.message,
    required this.user,
  });
}
