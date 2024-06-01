import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/post/create_post_model.dart';
import 'package:vangram/features/home/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/home/domain/entities/messages/chat_messages_entity.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';
import 'package:vangram/features/home/domain/entities/profile/profile_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();

  Future<Either<Failure, ProfileEntity>> getProfile();

  Future<Either<Failure, void>> createPost({required CreatePostModel post});

  Future<Either<Failure, List<PostEntity>>> getUserPosts();

  Future<Either<Failure, List<ChatEntity>>> getUserChats();

  Future<Either<Failure, List<ChatMessagesEntity>>> getChatMessages({required int chatId});
}
