import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/data_source/auth_local_source.dart';
import 'package:cubit_app/features/auth/data/data_source/auth_remote_source.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteSourceImpl _remoteSource = AuthRemoteSourceImpl();
  final AuthLocalSourceImpl _localSource = AuthLocalSourceImpl();
  @override
  Future<DataState<UserDataModel>> login(LogDataModel param) async {
    return _remoteSource.login(param);
  }

  @override
  Future<DataState<bool>> saveUserData(UserDataModel param) {
    return _localSource.saveUserData(param);
  }

  @override
  Future<DataState<UserDataModel>> getUserData() {
    return _localSource.getUSerData();
  }
}
