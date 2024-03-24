import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/models/sign_up.dart';
import 'package:vangram/features/authorization/domain/usecases/sign_up.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final SignUp _signUp;

  RegistrationBloc({required SignUp signUp})
      : _signUp = signUp,
        super(RegistrationState()) {
    on<RegistrationUserEvent>(_registration);
  }

  FutureOr<void> _registration(RegistrationUserEvent event, Emitter<RegistrationState> emit) async {
    try {
      emit(state.copyWith(status: RegStatus.loading));
      final data = await _signUp.call(params: event.signUpModel);
      data.fold(
        (error) => emit(state.copyWith(status: RegStatus.error)),
        (data) => emit(state.copyWith(status: RegStatus.loaded)),
      );
    } catch (error) {
      emit(state.copyWith(status: RegStatus.error));
    }
  }
}
