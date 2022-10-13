import 'dart:convert';

class UserPrescriptionModel {
    String userPrescriptionsId;
    String userId;
    String userName;
    String fileName;
    String remark;
  UserPrescriptionModel({
    required this.userPrescriptionsId,
    required this.userId,
    required this.userName,
    required this.fileName,
    required this.remark,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_prescriptions_id': userPrescriptionsId,
      'user_id': userId,
      'user_name': userName,
      'file_name': fileName,
      'remark': remark,
    };
  }

  factory UserPrescriptionModel.fromMap(Map<String, dynamic> map) {
    return UserPrescriptionModel(
      userPrescriptionsId: map['user_prescriptions_id'] ?? '',
      userId: map['user_id'] ?? '',
      userName: map['user_name'] ?? '',
      fileName: map['file_name'] ?? '',
      remark: map['remark'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserPrescriptionModel.fromJson(String source) => UserPrescriptionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserPrescriptionModel(userPrescriptionsId: $userPrescriptionsId, userId: $userId, userName: $userName, fileName: $fileName, remark: $remark)';
  }
}

