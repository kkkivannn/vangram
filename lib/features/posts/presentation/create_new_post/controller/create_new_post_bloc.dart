import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/helpers/models/create_post/create_post_model.dart';
import 'package:vangram/features/posts/domain/usecases/create_post.dart';

part 'create_new_post_event.dart';
part 'create_new_post_state.dart';

class CreateNewPostBloc extends Bloc<CreateNewPostEvent, CreateNewPostState> {
  final CreatePost _createPost;

  CreateNewPostBloc({required CreatePost createPost})
      : _createPost = createPost,
        super(CreateNewPostState()) {
    on<CreatePostEvent>(_createNewPost);
  }

  Future<void> _createNewPost(CreatePostEvent event, Emitter<CreateNewPostState> emit) async {
    try {
      emit(state.copyWith(status: CreateStatus.creating));
      final data = await _createPost.call(params: event.post);
      data.fold(
        (error) => emit(state.copyWith(status: CreateStatus.error)),
        (data) => emit(state.copyWith(status: CreateStatus.created)),
      );
    } catch (error) {
      emit(state.copyWith(status: CreateStatus.error));
    }
  }
}
