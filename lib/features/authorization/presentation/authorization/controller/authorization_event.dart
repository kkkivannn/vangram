part of 'authorization_bloc.dart';

sealed class AuthorizationEvent {}

final class SendPhoneEvent extends AuthorizationEvent {
  final SendPhoneModel sendPhoneModel;

  SendPhoneEvent({required this.sendPhoneModel});
}
