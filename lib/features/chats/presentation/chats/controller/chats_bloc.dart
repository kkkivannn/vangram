import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/utils/usecase/usecase.dart';
import 'package:vangram/features/chats/domain/entities/chats/chat_entity.dart';
import 'package:vangram/features/chats/domain/usecases/get_user_chats.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final GetUserChats _getUserChats;

  ChatsBloc({required GetUserChats getUserChats})
      : _getUserChats = getUserChats,
        super(ChatsState(status: ChatsStatus.initial)) {
    on<GetChatsEvent>(_getChats);
  }

  Future<void> _getChats(GetChatsEvent event, Emitter<ChatsState> emit) async {
    try {
      if (state.status != ChatsStatus.loaded) {
        emit(state.copyWith(status: ChatsStatus.loading));
      }
      final data = await _getUserChats.call(params: NoParams());
      data.fold(
        (error) => emit(state.copyWith(status: ChatsStatus.error)),
        (data) => emit(state.copyWith(status: ChatsStatus.loaded, chats: data)),
      );
    } catch (error) {
      emit(state.copyWith(status: ChatsStatus.error));
    }
  }
}
