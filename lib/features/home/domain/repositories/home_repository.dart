import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';
import 'package:vangram/features/home/domain/entities/profile/profile_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();

  Future<Either<Failure, ProfileEntity>> getProfile();
}