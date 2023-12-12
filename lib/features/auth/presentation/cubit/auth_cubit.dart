import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:cubit_app/features/auth/domain/usecases/login_uc.dart';
import 'package:cubit_app/features/auth/presentation/cubit/auth_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState?> {
  final _authRepoImpl = AuthRepoImpl();
  // final  logDataModel = LogDataModel.empty();
  UserDataModel userDataModel = UserDataModel.empty();
  AuthCubit() : super(null);

  login(LogDataModel param) async {
    LoginUseCase loginUC = LoginUseCase(_authRepoImpl);
    final dState = await loginUC.call(param);
    if(dState is SuccessState){
      userDataModel = dState.data!;
      
    }
  }
}
