// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessageModel _$UserMessageModelFromJson(Map<String, dynamic> json) =>
    UserMessageModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surname: json['surname'] as String,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserMessageModelToJson(UserMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'photo': instance.photo,
    };
