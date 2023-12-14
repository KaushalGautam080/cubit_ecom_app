
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';


class AppData{
  AppData._();


  UserDataModel _userDataModel = UserDataModel.empty();
  // LogDataModel _logDataModel = LogDataModel.empty();

  set setUserDataModel(UserDataModel userModel) => _userDataModel = userModel;
  // set setLogDataModel(LogDataModel logModel) => _logDataModel = logModel;

UserDataModel get udm => _userDataModel;

}