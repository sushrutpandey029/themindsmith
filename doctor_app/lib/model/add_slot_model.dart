// To parse this JSON data, do
//
//     final addSlotModel = addSlotModelFromMap(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

AddSlotModel addSlotModelFromMap(String str) => AddSlotModel.fromMap(json.decode(str));

String addSlotModelToMap(AddSlotModel data) => json.encode(data.toMap());

class AddSlotModel {
   

    String doctorId;
    String doctorsName;
    String scheduleDate;
    String startTime;
    String endTime;
    String avgSlotTiming;
  AddSlotModel({
    required this.doctorId,
    required this.doctorsName,
    required this.scheduleDate,
    required this.startTime,
    required this.endTime,
    required this.avgSlotTiming,
  });

    factory AddSlotModel.fromMap(Map<String, dynamic> json) => AddSlotModel(
        doctorId: json["doctor_id"],
        doctorsName: json["doctors_name"],
        scheduleDate: json["schedule_date"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        avgSlotTiming: json["avg_slot_timing"],
    );

    Map<String, dynamic> toMap() => {
        "doctor_id": doctorId,
        "doctors_name": doctorsName,
        "schedule_date": scheduleDate,
        "start_time": startTime,
        "end_time": endTime,
        "avg_slot_timing": avgSlotTiming,
    };

  @override
  String toString() {
    return 'AddSlotModel(doctorId: $doctorId, doctorsName: $doctorsName, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, avgSlotTiming: $avgSlotTiming)';
  }
}
