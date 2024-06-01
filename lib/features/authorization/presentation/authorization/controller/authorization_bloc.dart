import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vangram/core/helpers/models/send_phone_model.dart';
import 'package:vangram/features/authorization/domain/usecases/send_phone.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final SendPhone _sendPhone;

  AuthorizationBloc({required SendPhone sendPhone})
      : _sendPhone = sendPhone,
        super(AuthorizationState()) {
    on<SendPhoneEvent>(_sendUserPhone);
  }

  Future<void> _sendUserPhone(SendPhoneEvent event, Emitter<AuthorizationState> emit) async {
    try {
      final data = await _sendPhone.call(params: event.sendPhoneModel);
      data.fold(
        (error) => emit(state.copyWith(status: AuthStatus.error)),
        (data) => emit(state.copyWith(status: AuthStatus.loaded)),
      );
    } catch (error) {
      emit(state.copyWith(status: AuthStatus.error));
    }
  }
}
