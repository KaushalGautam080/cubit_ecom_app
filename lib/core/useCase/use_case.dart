import 'package:cubit_app/core/resources/data_state.dart';

abstract class UC<T>{
  Future<DataState<T>> call();
}