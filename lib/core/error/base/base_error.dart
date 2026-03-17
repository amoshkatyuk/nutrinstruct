abstract class BaseError {
  final String _message;

  BaseError({required String message}) : _message = message;

  String get errorMessage => _message;
}
