import 'package:cubit_app/features/auth/domain/entities/log_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'log_data_model.g.dart';
part 'log_data_model.freezed.dart';

@freezed
class LogDataModel extends LogData with _$LogDataModel {
  const factory LogDataModel({
    required String username,
    required String password,
    @Default(false) bool rememberMe,
    @Default(false) bool biometricEnabled,
  }) = _LogDataModel;

  factory LogDataModel.empty() => LogDataModel(
        username: "",
        password: "",
        rememberMe: false,
        biometricEnabled: false,
      );
      factory LogDataModel.fromJson(Map<String, dynamic> json) =>
      _$LogDataModelFromJson(json);
}
