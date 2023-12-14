
import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/core/useCase/use_case.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/domain/repository/auth_repo.dart';

class GetUserDataUseCase extends UC<UserDataModel>{
final AuthRepo _authRepo;

GetUserDataUseCase(this._authRepo);

  @override
  Future<DataState<UserDataModel>> call() async{
    return await _authRepo.getUserData();
    
  }

}