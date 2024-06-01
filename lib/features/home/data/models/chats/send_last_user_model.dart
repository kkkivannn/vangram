import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/domain/entities/chats/send_last_user_entity.dart';

part 'send_last_user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
base class SendLastUserModel extends SendLastUserEntity {
  SendLastUserModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.photo,
  });

  factory SendLastUserModel.fromJson(Map<String, dynamic> json) => _$SendLastUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendLastUserModelToJson(this);
}
