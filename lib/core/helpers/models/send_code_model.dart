import 'package:json_annotation/json_annotation.dart';

part 'send_code_model.g.dart';

@JsonSerializable()
base class SendCodeModel {
  final String phone;
  final String code;

  SendCodeModel({
    required this.phone,
    required this.code,
  });

  factory SendCodeModel.fromJson(Map<String, dynamic> json) => _$SendCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeModelToJson(this);
}
