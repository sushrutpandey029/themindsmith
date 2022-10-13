import 'dart:convert';

class UserModel {
  String userId;
  String userName;
  String userRegNo;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userRegNo,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userRegNo: map['userRegNo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(userId: $userId, userName: $userName, userRegNo: $userRegNo)';
}
