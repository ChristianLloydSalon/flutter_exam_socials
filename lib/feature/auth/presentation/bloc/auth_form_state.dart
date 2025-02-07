part of 'auth_form_bloc.dart';

class AuthFormState extends Equatable {
  const AuthFormState({
    this.username = '',
    this.usernameError = '',
    this.otp = '',
    this.otpError = '',
  });

  final String username;
  final String usernameError;
  final String otp;
  final String otpError;

  AuthFormState copyWith({
    String? username,
    String? usernameError,
    String? otp,
    String? otpError,
  }) {
    return AuthFormState(
      username: username ?? this.username,
      usernameError: usernameError ?? this.usernameError,
      otp: otp ?? this.otp,
      otpError: otpError ?? this.otpError,
    );
  }

  @override
  List<Object?> get props => [username, usernameError, otp, otpError];
}
