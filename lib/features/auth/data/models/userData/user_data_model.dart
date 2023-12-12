import 'package:cubit_app/features/auth/domain/entities/user_data_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user_data_model.g.dart';
part 'user_data_model.freezed.dart';

@freezed
class UserDataModel extends UserData with _$UserDataModel{
  const factory UserDataModel({
    required String accessToken,
    required String refreshToken,
    required int userId,
    required String userName,
    required int userGroupId,
    required String userGroupName,
    required int retailerId,
    required String retailerName,
    required int distributerId,
    required String distributerName,
    required UserType userType,
  }) =_UserDataModel;

  factory UserDataModel.empty() => const UserDataModel(
accessToken: "",
        refreshToken: "",
        userId: 0,
        userName: "",
        userGroupId: 0,
        userGroupName: "",
        retailerId: 0,
        retailerName: "",
        distributerId: 0,
        distributerName: "",
        userType: UserType.none,
  );
  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);
}
_$UserDataModelImpl _$$UserDataModelImplFromJson(Map<String, dynamic> json) {

  UserType userType =UserType.none;
  List userGroup = json["user_group"] as List;
  String retailerName = json["retailer_name"] ?? "";
  String distributerName = json["retailer_name"] ?? "";
  if(userGroup.isEmpty){
    userType = UserType.admin;
  }else if (retailerName.isNotEmpty){
    userType = UserType.retailer;
  }else if(distributerName.isNotEmpty){
    userType = UserType.distributor;
  }

  
   return  _$UserDataModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      userId: json['userId'] as int,
      userName: json['userName'] as String,
      userGroupId: userGroup.isEmpty ? 0:userGroup[0]["id"],
      userGroupName:userGroup.isEmpty ? "":userGroup[0]["name"],
      retailerId: json['retailerId'] as int,
      retailerName: json['retailerName'] as String,
      distributerId: json['distributerId'] as int,
      distributerName: json['distributerName'] as String,
      userType: userType,
    );
}
  

Map<String, dynamic> _$$UserDataModelImplToJson(_$UserDataModelImpl instance) {
  List userGroup = [];
  if(instance.userGroupId !=0 && instance.userGroupName != ""){
    userGroup.add({
      "id":instance.userGroupId,
      "name":instance.userGroupName,
  });
  }

    return {
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'userName': instance.userName,
      // 'userGroupId': instance.userGroupId,
      // 'userGroupName': instance.userGroupName,
      'user_group':userGroup,
      'retailerId': instance.retailerId,
      'retailerName': instance.retailerName,
      'distributerId': instance.distributerId,
      'distributerName': instance.distributerName,
      'userType': instance.userType.name,
    };
}