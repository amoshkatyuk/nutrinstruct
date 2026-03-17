import '../../../error/base/base_error.dart';

export 'base_data_failed.dart';
export 'base_data_success.dart';

abstract class BaseDataState<T> {
  final T? data;
  final BaseError? error;

  const BaseDataState({this.data, this.error});
}
