import 'package:json_annotation/json_annotation.dart';

base class MessageEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "id_user")
  final int idUser;
  @JsonKey(name: "body")
  final String body;
  @JsonKey(name: "is_mine")
  final bool isMine;
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  MessageEntity({
    required this.id,
    required this.idUser,
    required this.body,
    required this.isMine,
    required this.createdAt,
  });

  static DateTime createdAtFromJson(String json) {
    return DateTime.parse(json).toLocal();
  }
}
