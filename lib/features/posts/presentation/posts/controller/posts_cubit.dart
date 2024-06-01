import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/entities/post/post_entity.dart';
import 'package:vangram/features/home/domain/usecases/get_posts.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPosts _getPosts;

  PostsCubit({required GetPosts getPosts})
      : _getPosts = getPosts,
        super(PostsInitial());

  Future<void> getPosts() async {
    try {
      if (state is! PostsLoaded) {
        emit(PostsLoading());
      }
      final data = await _getPosts.call(params: NoParams());
      data.fold(
        (error) => emit(PostsError(message: error.toString())),
        (data) => emit(PostsLoaded(posts: data)),
      );
    } catch (error) {
      emit(PostsError(message: error.toString()));
    }
  }
}
