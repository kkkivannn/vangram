// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: (json['id'] as num).toInt(),
      idUser: (json['id_user'] as num).toInt(),
      body: json['body'] as String,
      isMine: json['is_mine'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.idUser,
      'body': instance.body,
      'is_mine': instance.isMine,
      'created_at': instance.createdAt.toIso8601String(),
    };
