class UserData {
  final String refreshToken;
  final String accessToken;
  final int userId;
  final String userName;
  final int userGroupId;
  final String userGroupName;
  final int retailerId;
  final String retailerName;
  final int distributerId;
  final String distributerName;
  final UserType userType;

  const UserData({
    required this.refreshToken,
    required this.accessToken,
    required this.userId,
    required this.userName,
    required this.userGroupId,
    required this.userGroupName,
    required this.retailerId,
    required this.retailerName,
    required this.distributerId,
    required this.distributerName,
    required this.userType,
  });
}
enum UserType{
none,
admin,
distributor,
retailer,
}
