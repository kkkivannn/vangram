part of 'create_new_post_bloc.dart';

sealed class CreateNewPostEvent {}

final class CreatePostEvent extends CreateNewPostEvent {
  final CreatePostModel post;

  CreatePostEvent({required this.post});
}
