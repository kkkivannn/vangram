import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/models/send_code_model.dart';
import 'package:vangram/features/authorization/domain/usecases/send_code.dart';

part 'enter_code_event.dart';
part 'enter_code_state.dart';

class EnterCodeBloc extends Bloc<EnterCodeEvent, EnterCodeState> {
  final SendCode _sendCode;

  EnterCodeBloc({required SendCode sendCode})
      : _sendCode = sendCode,
        super(EnterCodeState()) {
    on<SendCodeEvent>(_sendCodeToUser);
  }

  Future<void> _sendCodeToUser(SendCodeEvent event, Emitter<EnterCodeState> emit) async {
    try {
      final data = await _sendCode.call(params: event.sendCodeModel);
      data.fold(
        (error) => emit(state.copyWith(status: EnterCodeStatus.error)),
        (data) {
          if (data.hasProfile == false) {
            emit(state.copyWith(status: EnterCodeStatus.notHaveAccount));
          } else {
            emit(state.copyWith(status: EnterCodeStatus.loaded));
          }
        },
      );
    } catch (error) {
      emit(state.copyWith(status: EnterCodeStatus.error));
    }
  }
}
