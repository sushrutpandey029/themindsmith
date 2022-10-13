import 'dart:convert';

class SlotModel {
  String slotId;
  String doctorId;
  String doctorsName;
  String scheduleDate;
  String startTime;
  String endTime;
  String avgSlotTiming;
  String status;
  SlotModel({
    required this.slotId,
    required this.doctorId,
    required this.doctorsName,
    required this.scheduleDate,
    required this.startTime,
    required this.endTime,
    required this.avgSlotTiming,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'slot_id': slotId,
      'doctor_id': doctorId,
      'doctors_name': doctorsName,
      'schedule_date': scheduleDate,
      'start_time': startTime,
      'end_time': endTime,
      'avg_slot_timing': avgSlotTiming,
    };
  }

  factory SlotModel.fromMap(Map<String, dynamic> map) {
    return SlotModel(
      slotId: map['id'] ?? '',
      doctorId: map['doctor_id'] ?? '',
      doctorsName: map['doctors_name'] ?? '',
      scheduleDate: map['schedule_date'] ?? '',
      startTime: map['start_time'] ?? '',
      endTime: map['end_time'] ?? '',
      avgSlotTiming: map['avg_slot_timing'] ?? '',
      status: map['status']?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory SlotModel.fromJson(String source) => SlotModel.fromMap(json.decode(source));



  @override
  String toString() {
    return 'SlotModel(slotId: $slotId, doctorId: $doctorId, doctorsName: $doctorsName, scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, avgSlotTiming: $avgSlotTiming, status: $status)';
  }
}

