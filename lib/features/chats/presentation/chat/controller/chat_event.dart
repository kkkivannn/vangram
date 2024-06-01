part of 'chat_bloc.dart';

sealed class ChatEvent {}

final class GetMessagesEvent extends ChatEvent {
  final int chatId;

  GetMessagesEvent({required this.chatId});
}
