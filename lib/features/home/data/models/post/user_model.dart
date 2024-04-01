import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/domain/entities/post/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
base class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
