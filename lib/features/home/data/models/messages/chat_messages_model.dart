import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/data/models/messages/message_model.dart';
import 'package:vangram/features/home/data/models/messages/user_message_model.dart';
import 'package:vangram/features/home/domain/entities/messages/chat_messages_entity.dart';

part 'chat_messages_model.g.dart';

@JsonSerializable()
base class ChatMessagesModel extends ChatMessagesEntity {
  @JsonKey(name: 'message')
  final MessageModel messageModel;
  @JsonKey(name: 'user')
  final UserMessageModel userMessageModel;

  ChatMessagesModel({required this.messageModel, required this.userMessageModel})
      : super(message: messageModel, user: userMessageModel);

  factory ChatMessagesModel.fromJson(Map<String, dynamic> json) => _$ChatMessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessagesModelToJson(this);
}
