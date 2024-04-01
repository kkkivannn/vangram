import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/data/models/post/user_model.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';

part 'post_model.g.dart';

@JsonSerializable()
base class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.photo,
    required super.countLikes,
    required super.body,
    required super.createdAt,
    required super.uploadedAt,
    required this.userModel,
  }) : super(user: userModel);
  @JsonKey(name: 'user')
  final UserModel userModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
