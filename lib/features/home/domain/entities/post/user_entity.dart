import 'package:json_annotation/json_annotation.dart';

base class UserEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "surname")
  final String surname;
  @JsonKey(name: "photo")
  final dynamic photo;

  UserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.photo,
  });
}
