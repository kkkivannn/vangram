import 'package:json_annotation/json_annotation.dart';

part 'sign_up.g.dart';

@JsonSerializable()
base class SignUpModel {
  final String name;
  final String surname;
  final int age;
  final String phone;
  final String? photo;

  SignUpModel({
    required this.name,
    required this.surname,
    required this.age,
    required this.phone,
    required this.photo,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => _$SignUpModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
