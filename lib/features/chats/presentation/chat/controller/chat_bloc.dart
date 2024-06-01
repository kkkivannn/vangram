import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/features/chats/domain/entities/messages/chat_messages_entity.dart';
import 'package:vangram/features/chats/domain/usecases/get_chat_messages.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatMessages _getChatMessages;

  ChatBloc({required GetChatMessages getChatMessages})
      : _getChatMessages = getChatMessages,
        super(ChatState(status: ChatStatus.initial)) {
    on<GetMessagesEvent>(_getMessages);
  }

  Future<void> _getMessages(GetMessagesEvent event, Emitter<ChatState> emit) async {
    try {
      if (state.status != ChatStatus.loaded) {
        emit(state.copyWith(status: ChatStatus.loading));
      }
      final data = await _getChatMessages.call(params: event.chatId);
      data.fold(
        (error) => emit(state.copyWith(status: ChatStatus.error)),
        (data) => emit(state.copyWith(status: ChatStatus.loaded, chatMessages: data)),
      );
    } catch (error) {
      emit(state.copyWith(status: ChatStatus.error));
    }
  }
}
