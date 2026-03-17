import 'base_data_state.dart';

class DataFailed<T> extends BaseDataState<T> {
  const DataFailed({super.error});
}
