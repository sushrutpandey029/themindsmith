import 'dart:convert';
class NotificationModel {
  String notificationId;
  String userName;
  String userId;
  String doctorId;
  String doctorName;
  String notificationImage;
  String notificationText;
  String date;
  String status;
  NotificationModel({
    required this.notificationId,
    required this.userName,
    required this.userId,
    required this.doctorId,
    required this.doctorName,
    required this.notificationImage,
    required this.notificationText,
    required this.date,
    required this.status,
  });

 

  Map<String, dynamic> toMap() {
    return {
      'id': notificationId,
      'user_name': userName,
      'user_id': userId,
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'notification_image': notificationImage,
      'notification_text': notificationText,
      'date': date,
      'status' : status
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      notificationId: map['id'] ?? '',
      userName: map['user_name'] ?? '',
      userId: map['user_id'] ?? '',
      doctorId: map['doctor_id'] ?? '',
      doctorName: map['doctor_name'] ?? '',
      notificationImage: map['notification_image'] ?? '',
      notificationText: map['notification_text'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) => NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationModel(notificationId: $notificationId, userName: $userName, userId: $userId, doctorId: $doctorId, doctorName: $doctorName, notificationImage: $notificationImage, notificationText: $notificationText, date: $date, status: $status)';
  }
}
