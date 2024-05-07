part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, loaded, error }

final class ProfileState {
  final ProfileStatus status;
  final ProfileEntity? profile;
  final List<PostEntity>? posts;

  ProfileState({
    this.status = ProfileStatus.initial,
    this.profile,
    this.posts,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    ProfileEntity? profile,
    List<PostEntity>? posts,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      posts: posts ?? this.posts,
    );
  }
}
