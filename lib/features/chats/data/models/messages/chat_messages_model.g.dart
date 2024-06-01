// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessagesModel _$ChatMessagesModelFromJson(Map<String, dynamic> json) =>
    ChatMessagesModel(
      messageModel:
          MessageModel.fromJson(json['message'] as Map<String, dynamic>),
      userMessageModel:
          UserMessageModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatMessagesModelToJson(ChatMessagesModel instance) =>
    <String, dynamic>{
      'message': instance.messageModel,
      'user': instance.userMessageModel,
    };
