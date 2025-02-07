import '../../domain/entity/auth_request.dart';

class AuthRequestModel extends AuthRequest {
  const AuthRequestModel({
    required super.username,
    required super.otp,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': username,
      'otp': int.tryParse(otp),
    };
  }
}
