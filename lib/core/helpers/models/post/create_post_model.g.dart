// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostModel _$CreatePostModelFromJson(Map<String, dynamic> json) =>
    CreatePostModel(
      photo: json['photo'] as String?,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CreatePostModelToJson(CreatePostModel instance) =>
    <String, dynamic>{
      'photo': CreatePostModel._multiPartFromJson(instance.photo),
      'body': instance.body,
    };
