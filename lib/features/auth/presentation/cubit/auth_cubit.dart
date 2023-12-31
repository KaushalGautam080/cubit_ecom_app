import 'package:cubit_app/core/resources/data_state.dart';
import 'package:cubit_app/features/auth/data/models/logData/log_data_model.dart';
import 'package:cubit_app/features/auth/data/models/userData/user_data_model.dart';
import 'package:cubit_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:cubit_app/features/auth/domain/usecases/get_user_data_uc.dart';
import 'package:cubit_app/features/auth/domain/usecases/login_uc.dart';
import 'package:cubit_app/features/auth/domain/usecases/save_user_data_uc.dart';
import 'package:cubit_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:cubit_app/features/auth/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState?> {
  final _authRepoImpl = AuthRepoImpl();
  // final  logDataModel = LogDataModel.empty();
  UserDataModel userDataModel = UserDataModel.empty();
  
  AuthCubit() : super(null);

  login(LogDataModel param, BuildContext context) async {
    final dState = await LoginUseCase(_authRepoImpl).call(param);
    if (dState is SuccessState) {
      userDataModel = dState.data!;
      SaveUserDataUseCase(_authRepoImpl).call(userDataModel);
      if (context.mounted) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      }
    } else if (dState is FailureState && context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Error"),backgroundColor: Colors.red,));
    }
  }

  checkLogin() async{
    final  dState = await  GetUserDataUseCase(_authRepoImpl).call();
    print("Dstate: $dState");
    if(dState is SuccessState){
      userDataModel = dState.data!;
 
    }
    
  }
}
