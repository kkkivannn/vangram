part of 'enter_code_bloc.dart';

enum EnterCodeStatus { initial, loading, loaded, error, notHaveAccount }

final class EnterCodeState {
  final EnterCodeStatus status;

  EnterCodeState({this.status = EnterCodeStatus.initial});

  EnterCodeState copyWith({
    EnterCodeStatus? status,
  }) {
    return EnterCodeState(
      status: status ?? this.status,
    );
  }
}
