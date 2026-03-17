import '../data/base/data/base_data_state.dart';
import '../error/base/base_error.dart';
import '../error/default_error.dart';

abstract class BaseNoParamsUseCase<T> {
  Future<T> implement();

  Future<BaseDataState<T>> execute() async {
    try {
      final result = await implement();
      return DataSuccess(data: result);
    } on BaseError catch (error) {
      return DataFailed(error: error);
    } catch (_) {
      return DataFailed(error: DefaultError());
    }
  }
}
