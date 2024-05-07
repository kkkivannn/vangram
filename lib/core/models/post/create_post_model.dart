import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_post_model.g.dart';

@JsonSerializable()
base class CreatePostModel {
  @JsonKey(toJson: _multiPartFromJson)
  final String? photo;
  final String body;

  CreatePostModel({required this.photo, required this.body});

  factory CreatePostModel.fromJson(Map<String, dynamic> json) => _$CreatePostModelFromJson(json);

  Future<Map<String, dynamic>> toJson() async => _$CreatePostModelToJson(this);

  static Future<dynamic> _multiPartFromJson(String? path) async {
    if (path == null) {
      return null;
    }
    return await MultipartFile.fromFile(path);
  }
}
