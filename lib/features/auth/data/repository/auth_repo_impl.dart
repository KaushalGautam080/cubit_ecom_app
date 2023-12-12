import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/data_source/auth_remote_source.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final AuthRemoteSourceImpl _remoteSource = AuthRemoteSourceImpl();
  @override
  Future<DataState<UserDataModel>> login(LogDataModel param) async {
    return _remoteSource.login(param);
    
    
  }

}