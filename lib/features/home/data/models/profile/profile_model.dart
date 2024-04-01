import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/home/domain/entities/profile/profile_entity.dart';

part 'profile_model.g.dart';

@JsonSerializable()
base class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.age,
    required super.phone,
    required super.photo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
