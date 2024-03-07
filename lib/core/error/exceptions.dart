class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() {
    return 'ServerException: $message';
  }
}

class LocalException implements Exception {
  final String message;

  LocalException(this.message);
}
