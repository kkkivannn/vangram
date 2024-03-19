part of 'authorization_bloc.dart';

sealed class AuthorizationEvent {}

final class AuthorizationUserEvent extends AuthorizationEvent {}

final class RegistrationUserEvent extends AuthorizationEvent {}
