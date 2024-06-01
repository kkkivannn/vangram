// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_last_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendLastMessageModel _$SendLastMessageModelFromJson(
        Map<String, dynamic> json) =>
    SendLastMessageModel(
      id: (json['id'] as num).toInt(),
      body: json['body'] as String,
    );

Map<String, dynamic> _$SendLastMessageModelToJson(
        SendLastMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
    };
