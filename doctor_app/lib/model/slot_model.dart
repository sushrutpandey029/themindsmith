// To parse this JSON data, do
//
//     final slotModel = slotModelFromMap(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

SlotModel slotModelFromMap(String str) => SlotModel.fromMap(json.decode(str));

String slotModelToMap(SlotModel data) => json.encode(data.toMap());

class SlotModel {
   

    String id;
    String doctorId;
    String doctorsName;
    DateTime scheduleDate;
    String startTime;
    String endTime;
    String avgSlotTiming;
    String status;
  SlotModel({
    required this.id,
    required this.doctorId,
    required this.doctorsName,
    required this.scheduleDate,
    required this.startTime,
    required this.endTime,
    required this.avgSlotTiming,
    required this.status,
  });

    factory SlotModel.fromMap(Map<String, dynamic> json) => SlotModel(
        id: json["id"],
        doctorId: json["doctor_id"],
        doctorsName: json["doctors_name"],
        scheduleDate: DateTime.parse(json["schedule_date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        avgSlotTiming: json["avg_slot_timing"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "doctor_id": doctorId,
        "doctors_name": doctorsName,
        "schedule_date": "${scheduleDate.year.toString().padLeft(4, '0')}-${scheduleDate.month.toString().padLeft(2, '0')}-${scheduleDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "avg_slot_timing": avgSlotTiming,
        "status": status,
    };

  @override
  String toString() {
    return 'SlotModel(id: $id, doctorId: $doctorId, doctorsName: $doctorsName, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, avgSlotTiming: $avgSlotTiming, status: $status)';
  }
}
