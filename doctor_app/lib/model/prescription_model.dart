import 'dart:convert';

class PrescriptionModel {
  String doctorId;
  String doctorName;
  String userId;
  String userRegNo;
  String userName;
  String userFullName;
  String userEmail;
  String userAgeGender;
  String userSymptoms;
  String medicalHistory;
  PrescriptionModel({
    required this.doctorId,
    required this.doctorName,
    required this.userId,
    required this.userRegNo,
    required this.userName,
    required this.userFullName,
    required this.userEmail,
    required this.userAgeGender,
    required this.userSymptoms,
    required this.medicalHistory,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'user_id': userId,
      'user_reg_no': userRegNo,
      'user_name': userName,
      'user_full_name': userFullName,
      'user_email': userEmail,
      'user_age': userAgeGender,
      'user_symptoms': userSymptoms,
      'user_any_medical_history': medicalHistory,
    };
  }

  factory PrescriptionModel.fromMap(Map<String, dynamic> map) {
    return PrescriptionModel(
      doctorId: map['doctor_id'] ?? '',
      doctorName: map['doctor_name'] ?? '',
      userId: map['user_id'] ?? '',
      userRegNo: map['user_reg_no']??'',
      userName: map['user_name'] ?? '',
      userFullName: map['user_full_name'] ?? '',
      userEmail: map['user_email'] ?? '',
      userAgeGender: map['user_age'] ?? '',
      userSymptoms: map['user_symptoms'] ?? '',
      medicalHistory: map['user_any_medical_history'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PrescriptionModel.fromJson(String source) => PrescriptionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PrescriptionModel(doctorId: $doctorId, doctorName: $doctorName, userId: $userId, userName: $userName, userFullName: $userFullName, userEmail: $userEmail, userAgeGender: $userAgeGender, userSymptoms: $userSymptoms, medicalHistory: $medicalHistory)';
  }
}
