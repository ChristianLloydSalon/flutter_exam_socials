part of 'auth_form_bloc.dart';

abstract class AuthFormEvent extends Equatable {
  const AuthFormEvent();

  @override
  List<Object?> get props => [];
}

class AuthFormUsernameChanged extends AuthFormEvent {
  const AuthFormUsernameChanged(this.username);

  final String username;

  @override
  List<Object?> get props => [username];
}

class AuthFormOtpChanged extends AuthFormEvent {
  const AuthFormOtpChanged(this.otp);

  final String otp;

  @override
  List<Object?> get props => [otp];
}

class AuthFormCleared extends AuthFormEvent {
  const AuthFormCleared();
}
