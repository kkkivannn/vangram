part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, loaded, error }

final class ChatState {
  final ChatStatus status;
  final List<ChatMessagesEntity> chatMessages;

  ChatState({
    required this.status,
    this.chatMessages = const [],
  });

  ChatState copyWith({
    ChatStatus? status,
    List<ChatMessagesEntity>? chatMessages,
  }) {
    return ChatState(
      status: status ?? this.status,
      chatMessages: chatMessages ?? this.chatMessages,
    );
  }
}
