import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/core/useCase/use_case_param.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase extends UCP<UserDataModel,LogDataModel>{
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  @override
  Future<DataState<UserDataModel>> call(LogDataModel param) async{
    return await _authRepo.login(param);
  }
  
}