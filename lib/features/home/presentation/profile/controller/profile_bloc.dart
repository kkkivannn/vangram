import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/usecase/usecase.dart';
import 'package:vangram/features/home/domain/entities/profile/profile_entity.dart';
import 'package:vangram/features/home/domain/usecases/get_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile _getProfile;

  ProfileBloc({required GetProfile getProfile})
      : _getProfile = getProfile,
        super(ProfileState()) {
    on<GetProfileEvent>(_getUserProfile);
  }

  Future<void> _getUserProfile(GetProfileEvent event, Emitter<ProfileState> emit) async {
    try {
      emit(state.copyWith(status: ProfileStatus.loading));
      final data = await _getProfile.call(params: NoParams());
      data.fold(
        (error) => emit(state.copyWith(status: ProfileStatus.error)),
        (data) => emit(state.copyWith(status: ProfileStatus.loaded, profile: data)),
      );
    } catch (error) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
