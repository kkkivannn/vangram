import 'package:vangram/features/home/domain/entities/chats/send_last_message_entity.dart';

import 'send_last_user_entity.dart';

base class ChatEntity {
  final int id;
  final String name;
  final String? photo;
  final DateTime createdAt;
  final SendLastUserEntity? user;
  final SendLastMessageEntity? message;

  ChatEntity({
    required this.id,
    required this.name,
    required this.photo,
    required this.createdAt,
    required this.user,
    required this.message,
  });
}
