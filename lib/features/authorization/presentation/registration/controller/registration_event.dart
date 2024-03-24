part of 'registration_bloc.dart';

sealed class RegistrationEvent {}

final class RegistrationUserEvent extends RegistrationEvent {
  final SignUpModel signUpModel;

  RegistrationUserEvent({required this.signUpModel});
}
