part of 'authorization_bloc.dart';

enum AuthStatus { initial, loading, loaded, error }

final class AuthorizationState {
  final AuthStatus status;

  AuthorizationState({
    this.status = AuthStatus.initial,
  });

  AuthorizationState copyWith({
    AuthStatus? status,
  }) {
    return AuthorizationState(
      status: status ?? this.status,
    );
  }
}
