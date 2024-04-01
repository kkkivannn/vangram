part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, loaded, error }

final class ProfileState {
  final ProfileStatus status;
  final ProfileEntity? profile;

  ProfileState({
    this.status = ProfileStatus.initial,
    this.profile,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    ProfileEntity? profile,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
    );
  }
}
