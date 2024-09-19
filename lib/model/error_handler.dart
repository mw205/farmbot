class ErrorHandler {
  final String message;
  final int statusCode;
  final bool success;

  ErrorHandler(
      {required this.message, required this.statusCode, required this.success});
}
