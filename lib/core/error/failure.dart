abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = "Server error occurred"]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = "No internet connection"]);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = "Invalid username or PIN"]);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = "An unexpected error occurred"]);
}
