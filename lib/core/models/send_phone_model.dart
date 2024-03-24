import 'package:json_annotation/json_annotation.dart';

part 'send_phone_model.g.dart';

@JsonSerializable()
base class SendPhoneModel {
  final String phone;

  SendPhoneModel({required this.phone});

  factory SendPhoneModel.fromJson(Map<String, dynamic> json) => _$SendPhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendPhoneModelToJson(this);
}
