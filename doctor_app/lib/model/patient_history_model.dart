// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PatientHistoryModel welcomeFromMap(String str) => PatientHistoryModel.fromMap(json.decode(str));

String welcomeToMap(PatientHistoryModel data) => json.encode(data.toMap());

class PatientHistoryModel {
    PatientHistoryModel({
        required this.doctorId,
        required this.doctorName,
        required this.userId,
        required this.userRegNo,
        required this.userName,
        required this.patientName,
        required this.treatmentStartDate,
        required this.diagnosis,
        required this.city,
        required this.age,
        required this.gender,
        required this.note,
    });

    String doctorId;
    String doctorName;
    String userId;
    String userRegNo;
    String userName;
    String patientName;
    String treatmentStartDate;
    String diagnosis;
    String city;
    String age;
    String gender;
    String note;

    factory PatientHistoryModel.fromMap(Map<String, dynamic> json) => PatientHistoryModel(
        doctorId: json["doctor_id"],
        doctorName: json["doctor_name"],
        userId: json["user_id"],
        userRegNo: json["user_reg_no"],
        userName: json["user_name"],
        patientName: json["patient_name"],
        treatmentStartDate: json["treatment_start_date"],
        diagnosis: json["Diagnosis"],
        city: json["city"],
        age: json["age"],
        gender: json["gender"],
        note: json["Note"],
    );

    Map<String, dynamic> toMap() => {
        "doctor_id": doctorId,
        "doctor_name": doctorName,
        "user_id": userId,
        "user_reg_no": userRegNo,
        "user_name": userName,
        "patient_name": patientName,
        "treatment_start_date": treatmentStartDate,
        "Diagnosis": diagnosis,
        "city": city,
        "age": age,
        "gender": gender,
        "Note": note,
    };
}
