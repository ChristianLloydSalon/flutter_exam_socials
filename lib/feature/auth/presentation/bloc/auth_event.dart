part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested(this.request);

  final AuthRequest request;

  @override
  List<Object?> get props => [request];
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}
