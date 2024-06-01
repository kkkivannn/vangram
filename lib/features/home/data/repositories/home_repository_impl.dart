import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/post/create_post_model.dart';
import 'package:vangram/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:vangram/features/home/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/home/domain/entities/messages/chat_messages_entity.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';
import 'package:vangram/features/home/domain/entities/profile/profile_entity.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';

final class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _homeRemoteDatasource;

  HomeRepositoryImpl({required HomeRemoteDatasource homeRemoteDatasource})
      : _homeRemoteDatasource = homeRemoteDatasource;

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final data = await _homeRemoteDatasource.getPosts();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final data = await _homeRemoteDatasource.getProfile();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createPost({required CreatePostModel post}) async {
    try {
      final data = await _homeRemoteDatasource.createPost(post: post);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getUserPosts() async {
    try {
      final data = await _homeRemoteDatasource.getUserPosts();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatEntity>>> getUserChats() async {
    try {
      final data = await _homeRemoteDatasource.getUserChats();
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessagesEntity>>> getChatMessages({required int chatId}) async {
    try {
      final data = await _homeRemoteDatasource.getChatMessages(chatId: chatId);
      return Right(data);
    } catch (error) {
      return Left(ServerFailure(message: error.toString()));
    }
  }
}
