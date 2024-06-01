import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_chat_event.dart';
part 'create_chat_state.dart';

class CreateChatBloc extends Bloc<CreateChatEvent, CreateChatState> {
  CreateChatBloc() : super(CreateChatInitial()) {
    on<CreateChatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
