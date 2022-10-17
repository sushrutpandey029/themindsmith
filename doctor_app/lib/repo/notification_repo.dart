import 'package:dio/dio.dart';
import 'package:doctor_app/model/appointment_notification_model.dart';

import '../../constants/url_constant.dart';
import '../model/notification_model.dart';

class NotificationRepo {
  final String _notificationApi = "$baseUrl/Notification_api_controller";
  Future<List<NotificationModel>> fetchNotification(String userId) async {
    List<NotificationModel> list = [];
    String url = "$_notificationApi/doc_noti_list";

    Response response =
        await Dio().get(url, queryParameters: {"doctor_id": userId});
    print(response.data);
    if (response.data['Alldocnotificaton'] != null) {
      for (Map<String, dynamic> notificationMap
          in response.data['Alldocnotificaton']) {
        list.add(NotificationModel.fromMap(notificationMap));
      }
    }
    print(list);

    return list;
  }

  Future<List<AllotmentNotificationModel>> fetchAllotmentNotification(
      String userId) async {
    List<AllotmentNotificationModel> list = [];
    String url = "$_notificationApi/doctor_appointment_notification";

    Response response = await Dio().post(url, data: {"doctor_id": userId});
    // print(response.data);
    if (response.data['Allusernotification'] != null) {
      for (Map<String, dynamic> notificationMap
          in response.data['Allusernotification']) {
        list.add(AllotmentNotificationModel.fromMap(notificationMap));
      }
    }
    print(list);

    return list;
  }

  Future<void> updateReadStatusNotification(String notificationId) async {
    String url = "$_notificationApi/readnotification";
    Response response = await Dio()
        .post(url, data: {"notification_id": notificationId, "status": "read"});

    print(response.data);
  }

  // Future<void> updateReadStatusAppointment(String appointmentId) async {
  //   String url = "$_userApi/update_appointment_status";
  //   Response response = await Dio().post(url,
  //       data: {"appointment_id": appointmentId, "read_status": "read"});

  //   print(response.data);
  // }
}
