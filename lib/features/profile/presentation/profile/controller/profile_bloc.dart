import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/posts/domain/entities/post/post_entity.dart';
import 'package:vangram/features/posts/domain/usecases/get_user_posts.dart';
import 'package:vangram/features/profile/domain/entities/profile/profile_entity.dart';
import 'package:vangram/features/profile/domain/usecases/get_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;
  final GetUserPosts _getUserPosts;

  ProfileBloc({required GetProfile getProfile, required GetUserPosts getUserPosts})
      : _getProfile = getProfile,
        _getUserPosts = getUserPosts,
        super(ProfileState()) {
    on<GetProfileEvent>(_getUserProfile);
  }

  Future<void> _getUserProfile(GetProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      List<PostEntity>? userPostsEntity;
      ProfileEntity? profileEntity;
      if (state.status != ProfileStatus.loaded) {
        emit(state.copyWith(status: ProfileStatus.loading));
      }
      final profile = await _getProfile.call(params: NoParams());
      profile.fold(
        (error) => emit(state.copyWith(status: ProfileStatus.error)),
        (profile) => profileEntity = profile,
      );
      final userPosts = await _getUserPosts.call(params: NoParams());
      userPosts.fold((error) => emit(state.copyWith(status: ProfileStatus.error)), (posts) => userPostsEntity = posts);
      if (userPostsEntity == null || profileEntity == null) {
        emit(state.copyWith(status: ProfileStatus.error));
      } else {
        emit(state.copyWith(posts: userPostsEntity, profile: profileEntity, status: ProfileStatus.loaded));
      }
    } catch (error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
