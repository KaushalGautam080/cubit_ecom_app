import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';

abstract class AuthRepo{
  Future<DataState<UserDataModel>> login(LogDataModel param);
  // Future<DataState<bool>> saveLogData(LogDataModel param);
  Future<DataState<bool>> saveUserData(UserDataModel param);
  Future<DataState<UserDataModel>> getUserData();
}