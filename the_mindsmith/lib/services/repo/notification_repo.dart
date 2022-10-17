import 'package:dio/dio.dart';
import 'package:the_mindsmith/models/appointment_notification_model.dart';
import 'package:the_mindsmith/models/notification_model.dart';

import '../../constants/url_constant.dart';

class NotificationRepo {
  final String _notificationApi = "$baseUrl/Notification_api_controller";
  final String _userApi = "$baseUrl/Userapi_controller";
  Future<List<NotificationModel>> fetchNotification(String userId) async {
    List<NotificationModel> list = [];
    String url = "$_notificationApi/User_noti_list";
    Response response =
        await Dio().get(url, queryParameters: {"user_id": userId});
    if (response.data['Allusernotification'] != null) {
      for (Map<String, dynamic> notificationMap
          in response.data['Allusernotification']) {
        list.add(NotificationModel.fromMap(notificationMap));
      }
    }
    return list;
  }

  Future<List<AllotmentNotificationModel>> fetchAllotmentNotification(
      String userId) async {
    List<AllotmentNotificationModel> list = [];
    String url = "$_notificationApi/User_appointment_notification";

    Response response = await Dio().post(url, data: {"user_id": userId});
    print(response.data);
    if (response.data['Allusernotification'] != null) {
      for (Map<String, dynamic> notificationMap
          in response.data['Allusernotification']) {
        list.add(AllotmentNotificationModel.fromMap(notificationMap));
      }
    }
    // print(list);

    return list;
  }

  Future<void> updateReadStatusAppointment(String appointmentId) async {
    String url = "$_userApi/update_appointment_status";
    Response response = await Dio().post(url,
        data: {"appointment_id": appointmentId, "read_status": "read"});

    print(response.data);
  }

  Future<void> updateReadStatusNotification(String notificationId) async {
    String url = "$_notificationApi/readnotification";
    Response response = await Dio()
        .post(url, data: {"notification_id": notificationId, "status": "read"});

    print(response.data);
  }
}
