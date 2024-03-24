part of 'enter_code_bloc.dart';

sealed class EnterCodeEvent {}

final class SendCodeEvent extends EnterCodeEvent {
  final SendCodeModel sendCodeModel;

  SendCodeEvent({required this.sendCodeModel});
}
