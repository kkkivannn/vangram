// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_last_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendLastUserModel _$SendLastUserModelFromJson(Map<String, dynamic> json) =>
    SendLastUserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surname: json['surname'] as String,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$SendLastUserModelToJson(SendLastUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'photo': instance.photo,
    };
