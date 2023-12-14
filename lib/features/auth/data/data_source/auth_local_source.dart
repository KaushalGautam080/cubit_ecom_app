import 'dart:convert';

import 'package:cubit_app/core/exception/exception_handler.dart';
import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalSource {
  Future<DataState<bool>> saveUserData(UserDataModel param);
  Future<DataState<UserDataModel>> getUSerData();
}

class AuthLocalSourceImpl implements AuthLocalSource {
  @override
  Future<DataState<bool>> saveUserData(UserDataModel param) async {
    return await tryCatch<bool>(
      callBack: () async {
        SharedPreferences sharedP = await SharedPreferences.getInstance();
        sharedP.setString("userData", jsonEncode(param.toJson()));
        return const SuccessState(data: true);
      },
      errorMsg: "Failed to Save user Data",
      errorType: ErrorType.sharedPreferenceException,
    );
  }

  @override
  Future<DataState<UserDataModel>> getUSerData() async {
    return await tryCatch<UserDataModel>(callBack: () async {
      SharedPreferences sharedP = await SharedPreferences.getInstance();
      String userData = sharedP.getString("userData") ?? "";
      if (userData.isNotEmpty) {
        UserDataModel userDataModel =
            UserDataModel.fromJson(jsonDecode(userData));
        return SuccessState(data: userDataModel);
      }
      return const FailureState<UserDataModel>(
        error: "User Data not Found",
        errorMsg: "User data is not saved",
      );
    });
  }
}
