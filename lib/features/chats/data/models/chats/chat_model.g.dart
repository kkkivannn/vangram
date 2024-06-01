// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      photo: json['photo'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      sendLastUserModel: json['user'] == null
          ? null
          : SendLastUserModel.fromJson(json['user'] as Map<String, dynamic>),
      sendLastMessageModel: json['message'] == null
          ? null
          : SendLastMessageModel.fromJson(
              json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'created_at': instance.createdAt.toIso8601String(),
      'user': instance.sendLastUserModel,
      'message': instance.sendLastMessageModel,
    };
