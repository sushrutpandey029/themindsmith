import 'dart:convert';

class PrescriptionModel {
  String doctorId;
  String doctorName;
  String doctorQualification;
  String userId;
  String userRegNo;
  String userName;
  String userFullName;
  String userEmail;
  String userAgeGender;
  String userSymptoms;
  String notes;
  String pvalidtime;
  String? pclientid;
  String? date;
  PrescriptionModel({
    required this.doctorId,
    required this.doctorName,
    required this.doctorQualification,
    required this.userId,
    required this.userRegNo,
    required this.userName,
    required this.userFullName,
    required this.userEmail,
    required this.userAgeGender,
    required this.userSymptoms,
    required this.notes,
    required this.pvalidtime,
    this.pclientid,
    this.date,
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
      'notes': notes,
      'client_id': pclientid,
      'daretime': date,
      'valid_date': pvalidtime,
      'doctor_qualification': doctorQualification
    };
  }

  factory PrescriptionModel.fromMap(Map<String, dynamic> map) {
    return PrescriptionModel(
      doctorId: map['doc_id'] ?? '',
      doctorName: map['doc_name'] ?? '',
      userId: map['user_id'] ?? '',
      userRegNo: map['user_reg_no'] ?? '',
      userName: map['user_name'] ?? '',
      userFullName: map['user_full_name'] ?? '',
      userEmail: map['user_email'] ?? '',
      userAgeGender: map['user_age'] ?? '',
      userSymptoms: map['user_symptoms'] ?? '',
      notes: map['notes'] ?? '',
      date: map['daretime'] ?? '',
      pclientid: map['client_id'] ?? '',
      pvalidtime: map['p_valid_date'] ?? '',
      doctorQualification: map['doctor_qualification'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PrescriptionModel.fromJson(String source) =>
      PrescriptionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PrescriptionModel(doctorId: $doctorId, doctorName: $doctorName, userId: $userId, userName: $userName, userFullName: $userFullName, userEmail: $userEmail, userAgeGender: $userAgeGender, userSymptoms: $userSymptoms, notes: $notes,)';
  }
}
