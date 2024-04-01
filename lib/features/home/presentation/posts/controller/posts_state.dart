part of 'posts_cubit.dart';

sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsLoaded extends PostsState {
  final List<PostEntity> posts;

  PostsLoaded({required this.posts});
}

final class PostsError extends PostsState {
  final String message;

  PostsError({required this.message});
}
