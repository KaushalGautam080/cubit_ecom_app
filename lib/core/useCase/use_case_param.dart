import 'package:cubit_app/core/resources/data_state.dart';

abstract class UCP<T,P>{
Future<DataState<T>> call(P param);
}