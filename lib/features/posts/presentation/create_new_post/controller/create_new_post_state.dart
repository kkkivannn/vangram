part of 'create_new_post_bloc.dart';

enum CreateStatus { initial, creating, created, error }

final class CreateNewPostState {
  final CreateStatus status;

  CreateNewPostState({
    this.status = CreateStatus.initial,
  });

  CreateNewPostState copyWith({
    CreateStatus? status,
  }) {
    return CreateNewPostState(
      status: status ?? this.status,
    );
  }
}
