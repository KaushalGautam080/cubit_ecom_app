import 'package:cubit_app/core/constants/api_path.dart';
import 'package:cubit_app/core/exception/exception_handler.dart';
import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteSource {
  Future<DataState<UserDataModel>> login(LogDataModel param);
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<DataState<UserDataModel>> login(LogDataModel param) async {
    return await tryCatch<UserDataModel>(callBack: () async {
      FormData formData = FormData.fromMap({
        "username": param.username,
        "password": param.password,
      });
      Dio dio = Dio();

      final response = await dio.post(loginUrl,
          data: formData,
          options: Options(
            validateStatus: (status) => status == 200,
          ));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        UserDataModel userDataModel = UserDataModel.fromJson(data);
        return SuccessState(data: userDataModel);
      }
    });
  }
}
