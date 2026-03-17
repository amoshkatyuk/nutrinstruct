import '../data/base/data/base_data_state.dart';
import '../error/base/base_error.dart';
import '../error/default_error.dart';

abstract class BaseUseCase<T, Params> {
  Future<T> implement(Params param);

  Future<BaseDataState<T>> execute(Params param) async {
    try {
      final result = await implement(param);
      return DataSuccess(data: result);
    } on BaseError catch (error) {
      return DataFailed(error: error);
    } catch (_) {
      return DataFailed(error: DefaultError());
    }
  }
}
