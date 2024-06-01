import 'package:vangram/core/helpers/models/post/create_post_model.dart';
import 'package:vangram/features/home/data/models/chats/chat_model.dart';
import 'package:vangram/features/home/data/models/messages/chat_messages_model.dart';
import 'package:vangram/features/home/data/models/post/post_model.dart';
import 'package:vangram/features/home/data/models/profile/profile_model.dart';

abstract interface class HomeRemoteDatasource {
  Future<List<PostModel>> getPosts();

  Future<ProfileModel> getProfile();

  Future<void> createPost({required CreatePostModel post});

  Future<List<PostModel>> getUserPosts();

  Future<List<ChatModel>> getUserChats();

  Future<List<ChatMessagesModel>> getChatMessages({required int chatId});
}
