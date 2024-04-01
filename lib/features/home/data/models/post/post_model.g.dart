// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as int,
      photo: json['photo'] as String,
      countLikes: json['count_likes'] as int,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      uploadedAt: json['uploaded_at'],
      userModel: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'count_likes': instance.countLikes,
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
      'uploaded_at': instance.uploadedAt,
      'user': instance.userModel,
    };
