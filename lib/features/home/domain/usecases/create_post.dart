import 'package:dartz/dartz.dart';
import 'package:vangram/core/error/error.dart';
import 'package:vangram/core/helpers/models/post/create_post_model.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/repositories/home_repository.dart';

final class CreatePost implements UseCase<void, CreatePostModel> {
  final HomeRepository _homeRepository;

  CreatePost({required HomeRepository homeRepository}) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, void>> call({required CreatePostModel params}) async {
    return await _homeRepository.createPost(post: params);
  }
}
