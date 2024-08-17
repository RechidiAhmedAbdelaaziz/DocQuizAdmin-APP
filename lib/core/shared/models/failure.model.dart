class Failure extends Error {
  final String message;

  Failure(String? message) : message = message ?? 'An error occurred';
}
