class AuthValidator {
  const AuthValidator._();

  static String validateUsername(String username) {
    if (username.isEmpty) return "Please enter your username";

    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username)) {
      return "Values must be alphanumeric";
    }

    if (username.length > 24) return "Must not exceed 24 characters";

    return '';
  }

  static String validateOtp(String otp) {
    if (otp.isEmpty) return "OTP must not be empty";

    if (otp.length != 6) return "OTP must be exactly 6 digits";

    return '';
  }
}
