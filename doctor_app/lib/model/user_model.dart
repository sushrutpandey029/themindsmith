import 'dart:convert';

class UserModel {
  String userId;
  String userName;
  String userRegNo;
  DateTime dateTime;
  UserModel({
    required this.userId,
    required this.userName,
    required this.userRegNo,
    required this.dateTime,
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
      dateTime: map['dateTime'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(userId: $userId, userName: $userName, userRegNo: $userRegNo)';
}
