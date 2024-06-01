import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vangram/core/constants/endpoints.dart';
import 'package:vangram/core/helpers/models/post/create_post_model.dart';
import 'package:vangram/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:vangram/features/home/data/models/chats/chat_model.dart';
import 'package:vangram/features/home/data/models/messages/chat_messages_model.dart';
import 'package:vangram/features/home/data/models/post/post_model.dart';
import 'package:vangram/features/home/data/models/profile/profile_model.dart';

final class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final Dio _dio;

  HomeRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final Response response = await _dio.get(Endpoints.posts.path);
      return List.from(
        (response.data as List<dynamic>)
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList(),
      );
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final Response response = await _dio.get(Endpoints.profile.path);
      return ProfileModel.fromJson(response.data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<void> createPost({required CreatePostModel post}) async {
    try {
      FormData data = FormData.fromMap(await post.toJson());
      await _dio.post(Endpoints.post.path, data: data);
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<List<PostModel>> getUserPosts() async {
    try {
      final response = await _dio.get(Endpoints.userPosts.path);
      return List.from(
        (response.data as List<dynamic>)
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList(),
      );
    } on DioException catch (error) {
      return error.response?.data;
    }
  }

  @override
  Future<List<ChatModel>> getUserChats() async {
    try {
      final response = await _dio.get(Endpoints.chats.path);
      return List.from((response.data as List<dynamic>).map((json) => ChatModel.fromJson(json)).toList());
    } on DioException catch (error) {
      throw error.response?.data;
    }
  }

  @override
  Future<List<ChatMessagesModel>> getChatMessages({required int chatId}) async {
    try {
      final Response response = await _dio.get(
        Endpoints.messages.path,
        data: jsonEncode(
          {
            "id_chat": chatId,
          },
        ),
      );
      return List.from((response.data as List<dynamic>).map((json) => ChatMessagesModel.fromJson(json)).toList());
    } on DioException catch (error) {
      return error.response?.data;
    }
  }
}
