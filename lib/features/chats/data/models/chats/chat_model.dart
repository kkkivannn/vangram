import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/chats/data/models/chats/send_last_message_model.dart';
import 'package:vangram/features/chats/data/models/chats/send_last_user_model.dart';
import 'package:vangram/features/chats/domain/entities/chats/chat_entity.dart';

part 'chat_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
base class ChatModel extends ChatEntity {
  ChatModel({
    required super.id,
    required super.name,
    required super.photo,
    required super.createdAt,
    required this.sendLastUserModel,
    required this.sendLastMessageModel,
  }) : super(user: sendLastUserModel, message: sendLastMessageModel);

  @JsonKey(name: 'user')
  final SendLastUserModel? sendLastUserModel;
  @JsonKey(name: 'message')
  final SendLastMessageModel? sendLastMessageModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
