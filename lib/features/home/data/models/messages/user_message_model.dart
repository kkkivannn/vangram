import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/domain/entities/messages/user_message_entity.dart';

part 'user_message_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
base class UserMessageModel extends UserMessageEntity {
  UserMessageModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.photo,
  });

  factory UserMessageModel.fromJson(Map<String, dynamic> json) => _$UserMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserMessageModelToJson(this);
}
