import 'package:json_annotation/json_annotation.dart';

base class TokensEntity {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'has_profile')
  final bool hasProfile;

  TokensEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.hasProfile,
  });
}
