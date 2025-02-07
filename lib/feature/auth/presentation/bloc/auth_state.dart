part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User user;
  final AuthStatus authStatus;
  final AuthRequestStatus requestStatus;

  const AuthState({
    this.user = User.empty,
    this.authStatus = AuthStatus.unauthenticated,
    this.requestStatus = AuthRequestStatus.initial,
  });

  AuthState copyWith({
    User? user,
    AuthStatus? authStatus,
    AuthRequestStatus? requestStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      requestStatus: requestStatus ?? this.requestStatus,
    );
  }

  @override
  List<Object?> get props => [user, authStatus, requestStatus];
}

enum AuthStatus {
  authenticated,
  unauthenticated;

  bool get isAuthenticated => this == AuthStatus.authenticated;

  bool get isUnauthenticated => this == AuthStatus.unauthenticated;
}

enum AuthRequestStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == AuthRequestStatus.initial;

  bool get isLoading => this == AuthRequestStatus.loading;

  bool get isSuccess => this == AuthRequestStatus.success;

  bool get isError => this == AuthRequestStatus.error;
}
