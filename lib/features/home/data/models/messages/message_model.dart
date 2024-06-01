import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/domain/entities/messages/message_entity.dart';

part 'message_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
base class MessageModel extends MessageEntity {
  MessageModel({
    required super.id,
    required super.idUser,
    required super.body,
    required super.isMine,
    required super.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
