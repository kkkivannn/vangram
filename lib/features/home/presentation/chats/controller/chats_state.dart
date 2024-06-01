part of 'chats_bloc.dart';

enum ChatsStatus { initial, loading, loaded, error }

final class ChatsState {
  final ChatsStatus status;
  final List<ChatEntity> chats;

  ChatsState({
    required this.status,
    this.chats = const [],
  });

  ChatsState copyWith({
    ChatsStatus? status,
    List<ChatEntity>? chats,
  }) {
    return ChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
    );
  }
}
