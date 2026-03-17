import 'base/base_error.dart';

class DefaultError extends BaseError {
  DefaultError() : super(message: 'Произошла неизвестная ошибка.');
}
