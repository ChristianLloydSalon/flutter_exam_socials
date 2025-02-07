/// API error
class ServerException implements Exception {}

/// No internet connection
class NetworkException implements Exception {}

/// Invalid credentials
class UnauthorizedException implements Exception {}

/// Unexpected response format
class InvalidResponseException implements Exception {}
