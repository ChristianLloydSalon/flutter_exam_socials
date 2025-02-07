import 'package:equatable/equatable.dart';

class AuthRequest extends Equatable {
  const AuthRequest({
    required this.username,
    required this.otp,
  });

  final String username;
  final String otp;

  @override
  List<Object?> get props => [username, otp];
}
