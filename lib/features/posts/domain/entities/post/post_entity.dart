import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/posts/domain/entities/post/user_entity.dart';

base class PostEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "photo")
  final String photo;
  @JsonKey(name: "count_likes")
  final int countLikes;
  @JsonKey(name: "body")
  final String body;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "uploaded_at")
  final dynamic uploadedAt;
  final UserEntity user;

  PostEntity({
    required this.id,
    required this.photo,
    required this.countLikes,
    required this.body,
    required this.createdAt,
    required this.uploadedAt,
    required this.user,
  });
}
