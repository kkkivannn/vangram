import 'package:dio/dio.dart';
import 'package:vangram/features/chats/data/datasources/remote/chats_remote_datasource.dart';

final class IChatsRemoteDatasource implements ChatsRemoteDatasource {
  final Dio _dio;

  IChatsRemoteDatasource({required Dio dio}) : _dio = dio;
}
