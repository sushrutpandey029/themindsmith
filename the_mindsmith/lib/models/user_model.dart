import 'dart:convert';

class UserModel {
  String userRegNo;
  String userName;
  String userEmail;
  String userPhone;
  String userPassword;
  String userConfirmPassword;
  String aadharName;
  String aadharCardNo;
  String gender;
  String userAge;
  String frontImageAadhar;
  String backImageAadhar;
  String panCardImage;
  String userlocation;
  UserModel({
    required this.userRegNo,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
    required this.userConfirmPassword,
    required this.aadharName,
    required this.aadharCardNo,
    required this.gender,
    required this.userAge,
    required this.frontImageAadhar,
    required this.backImageAadhar,
    required this.panCardImage,
    required this.userlocation,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_reg_no': userRegNo,
      'user_name': userName,
      'user_email': userEmail,
      'user_phone': userPhone,
      'user_password': userPassword,
      'location': userlocation,
      'user_confirm_password': userConfirmPassword,
      'aadhar_name': aadharName,
      'aadhar_card_no': aadharCardNo,
      'gender': gender,
      'user_age': userAge,
      'front_image_aadhar': frontImageAadhar,
      'back_image_aadhar': backImageAadhar,
      'pencard_image': panCardImage
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userRegNo: map['user_reg_no'] ?? '',
      userName: map['user_name'] ?? '',
      userEmail: map['user_email'] ?? '',
      userPhone: map['user_phone'] ?? '',
      userPassword: map['user_password'] ?? '',
      userConfirmPassword: map['user_confirm_password'] ?? '',
      aadharName: map['aadhar_name'] ?? '',
      aadharCardNo: map['aadhar_card_no'] ?? '',
      gender: map['gender'] ?? '',
      userAge: map['user_age'] ?? '',
      frontImageAadhar: map['front_image_aadhar'] ?? '',
      backImageAadhar: map['back_image_aadhar'] ?? '',
      panCardImage: map['pencard_image'] ?? '',
      userlocation: map['location'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userRegNo: $userRegNo, userName: $userName, userEmail: $userEmail, userPhone: $userPhone, userPassword: $userPassword, userConfirmPassword: $userConfirmPassword, aadharName: $aadharName, aadharCardNo: $aadharCardNo, gender: $gender, userAge: $userAge, frontImageAadhar: $frontImageAadhar, backImageAadhar: $backImageAadhar, panCardImage: $panCardImage)';
  }
}
