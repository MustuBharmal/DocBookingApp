class ServerException implements Exception {
  final String message;

  ServerException([this.message = "Server is currently unavailable"]);

  @override
  String toString() => "ServerException: $message";
}
