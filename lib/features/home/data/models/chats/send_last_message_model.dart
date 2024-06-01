import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/domain/entities/chats/send_last_message_entity.dart';

part 'send_last_message_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
base class SendLastMessageModel extends SendLastMessageEntity {
  SendLastMessageModel({required super.id, required super.body});

  factory SendLastMessageModel.fromJson(Map<String, dynamic> json) => _$SendLastMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendLastMessageModelToJson(this);
}
