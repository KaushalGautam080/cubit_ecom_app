import 'package:cubit_app/core/resources/data_state.dart';
import 'package:flutter/material.dart';

Future<DataState<T>> tryCatch<T>({
  required Future Function() callBack,
  String errorMsg = "Error Occurred",
  ErrorType errorType = ErrorType.unknown,
}) async {
  try {
    return await callBack();
  } catch (error) {
    debugPrint(error.toString());
    return FailureState(
      error: error.toString(),
      errorMsg: errorMsg,
      errorType: errorType,
    );
  }
}
