import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/features/authorization/domain/usecases/sign_up.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final SignUp _signUp;
  AuthorizationBloc({required SignUp signUp})
      : _signUp = signUp,
        super(AuthorizationInitial()) {
    on<RegistrationUserEvent>(_registartion);
  }

  FutureOr<void> _registartion(RegistrationUserEvent event, Emitter<AuthorizationState> emit) {
    try {} catch (error) {}
  }
}
