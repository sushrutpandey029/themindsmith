import 'dart:convert';

class BookSlotModel {
  String userId;
  String userRegNo;
  String userName;
  String slotId;
  String doctorsId;
  String doctorsName;
  String timeSlot;
  String startTime;
  String endTime;
  String appointmentDate;
  String videoToken;
  BookSlotModel({
    required this.userId,
    required this.userRegNo,
    required this.userName,
    required this.slotId,
    required this.doctorsId,
    required this.doctorsName,
    required this.timeSlot,
    required this.startTime,
    required this.endTime,
    required this.appointmentDate,
    required this.videoToken,
  });

  @override
  String toString() {
    return 'BookSlotModel(userId: $userId, userRegNo: $userRegNo, userName: $userName, slotId: $slotId, doctorsId: $doctorsId, doctorsName: $doctorsName, timeSlot: $timeSlot, startTime: $startTime, endTime: $endTime, appointmentDate: $appointmentDate, videoToken: $videoToken)';
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'user_reg_no': userRegNo,
      'user_name': userName,
      'slot_id': slotId,
      'doctors_id': doctorsId,
      'doctors_name': doctorsName,
      'time_slot': timeSlot,
      'start_time': startTime,
      'end_time': endTime,
      'appointment_date': appointmentDate,
      'video_token': videoToken
    };
  }

  factory BookSlotModel.fromMap(Map<String, dynamic> map) {
    return BookSlotModel(
      userId: map['user_id'] ?? '',
      userRegNo: map['user_reg_no']?? '',
      userName: map['user_name'] ?? '',
      slotId: map['slot_id'] ?? '',
      doctorsId: map['doctors_id'] ?? '',
      doctorsName: map['doctors_name'] ?? '',
      timeSlot: map['time_slot'] ?? '',
      startTime: map['start_time'] ?? '',
      endTime: map['end_time'] ?? '',
      appointmentDate: map['appointment_date'] ?? '',
      videoToken: map['video_token']?? ''
    );
  }

  String toJson() => json.encode(toMap());

  factory BookSlotModel.fromJson(String source) => BookSlotModel.fromMap(json.decode(source));
}
