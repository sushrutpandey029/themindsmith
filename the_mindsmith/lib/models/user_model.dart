// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'dart:convert';


UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
   
    String id;
    String userRegNo;
    String userName;
    String userImage;
    String userEmail;
    String userPhone;
    String aadharName;
    String aadharCardNo;
    String gender;
    String userAge;
  UserModel({
    required this.id,
    required this.userRegNo,
    required this.userName,
    required this.userImage,
    required this.userEmail,
    required this.userPhone,
    required this.aadharName,
    required this.aadharCardNo,
    required this.gender,
    required this.userAge,
  });

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        userRegNo: json["user_reg_no"],
        userName: json["user_name"],
        userImage: json["user_image"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        aadharName: json["aadhar_name"],
        aadharCardNo: json["aadhar_card_no"],
        gender: json["gender"],
        userAge: json["user_age"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_reg_no": userRegNo,
        "user_name": userName,
        "user_image": userImage,
        "user_email": userEmail,
        "user_phone": userPhone,
        "aadhar_name": aadharName,
        "aadhar_card_no": aadharCardNo,
        "gender": gender,
        "user_age": userAge,
    };

  @override
  String toString() {
    return 'UserModel(id: $id, userRegNo: $userRegNo, userName: $userName, userImage: $userImage, userEmail: $userEmail, userPhone: $userPhone, aadharName: $aadharName, aadharCardNo: $aadharCardNo, gender: $gender, userAge: $userAge)';
  }
}
