import 'package:json_annotation/json_annotation.dart';
import 'package:vangram/features/authorization/domain/entities/tokens/tokens_entity.dart';

part 'tokens_model.g.dart';

@JsonSerializable()
base class TokensModel extends TokensEntity {
  TokensModel({
    required super.accessToken,
    required super.refreshToken,
    required super.hasProfile,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) => _$TokensModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokensModelToJson(this);
}
