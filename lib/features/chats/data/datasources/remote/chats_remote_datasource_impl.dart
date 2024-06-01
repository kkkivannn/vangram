import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vangram/core/constants/endpoints.dart';
import 'package:vangram/features/chats/data/datasources/remote/chats_remote_datasource.dart';
import 'package:vangram/features/chats/data/models/chats/chat_model.dart';
import 'package:vangram/features/chats/data/models/messages/chat_messages_model.dart';

final class IChatsRemoteDatasource implements ChatsRemoteDatasource {
  final Dio _dio;

  IChatsRemoteDatasource({required Dio dio}) : _dio = dio;

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
