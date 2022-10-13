class SlotModel {
  String appointmentId;
  String userId;
  String userRegNo;
  String userName;
  String slotId;
  String doctorsId;
  String doctorName;
  String timeSlot;
  String startedTime;
  String endTime;
  String appointmentDate;
  String videoToken;
  String bookStatus;
  String readStatus;
  SlotModel(
      {required this.appointmentId,
      required this.userId,
      required this.userRegNo,
      required this.userName,
      required this.slotId,
      required this.doctorsId,
      required this.doctorName,
      required this.timeSlot,
      required this.startedTime,
      required this.endTime,
      required this.appointmentDate,
      required this.videoToken,
      required this.bookStatus,
      required this.readStatus});

  factory SlotModel.fromMap(Map<String, dynamic> json) => SlotModel(
        appointmentId: json["id"],
        userId: json["user_id"],
        userRegNo: json["user_reg_no"],
        userName: json["user_name"],
        slotId: json["slot_id"],
        doctorsId: json["doctors_id"],
        doctorName: json["doctor_name"],
        timeSlot: json["time_slot"],
        startedTime: json["started_time"],
        endTime: json["end_time"],
        appointmentDate: json["appointment_date"],
        videoToken: json["video_token"] ?? "",
        bookStatus: json["book_status"] ?? '',
        readStatus: json["read_status"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": appointmentId,
        "user_id": userId,
        "user_reg_no": userRegNo,
        "user_name": userName,
        "slot_id": slotId,
        "doctors_id": doctorsId,
        "doctor_name": doctorName,
        "time_slot": timeSlot,
        "started_time": startedTime,
        "end_time": endTime,
        "appointment_date": appointmentDate,
        "video_token": videoToken,
        "book_status": bookStatus,
        "read_status": readStatus
      };

  @override
  String toString() {
    return 'SlotModel(appointmentId: $appointmentId, userId: $userId, userRegNo: $userRegNo, userName: $userName, slotId: $slotId, doctorsId: $doctorsId, doctorName: $doctorName, timeSlot: $timeSlot, startedTime: $startedTime, endTime: $endTime, appointmentDate: $appointmentDate, videoToken: $videoToken, bookStatus: $bookStatus, readStatus: $readStatus)';
  }
}
