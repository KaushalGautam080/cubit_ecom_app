import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/core/useCase/use_case_param.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/domain/repository/auth_repo.dart';

class SaveUserDataUseCase extends UCP<bool,UserDataModel>{
  final AuthRepo _authRepo;
   SaveUserDataUseCase(this._authRepo);

  @override
  Future<DataState<bool>> call(UserDataModel param) async{
    return await _authRepo.saveUserData(param);
  } 
}