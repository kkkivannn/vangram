part of 'registration_bloc.dart';

enum RegStatus { initial, loading, loaded, error }

class RegistrationState {
  final RegStatus status;

  RegistrationState({
    this.status = RegStatus.initial,
  });

  RegistrationState copyWith({
    RegStatus? status,
  }) {
    return RegistrationState(
      status: status ?? this.status,
    );
  }
}
