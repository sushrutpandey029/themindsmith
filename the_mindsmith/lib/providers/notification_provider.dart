import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/appointment_notification_model.dart';
import 'package:the_mindsmith/models/notification_model.dart';
import 'package:the_mindsmith/services/repo/notification_repo.dart';
import 'package:the_mindsmith/ui/screens/appointment_details.dart';

import 'auth_provider.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepo _notificationRepo = NotificationRepo();
  bool isLoading = false;
  List<NotificationModel> notificationList = [];
  List<AllotmentNotificationModel> allotmentNotificationList = [];
  AllotmentNotificationModel? selectedAllotment;
  int unreadNotificationCount = 0;

  Future<void> fetchNotification(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    String id =
        Provider.of<AuthProvider>(context, listen: false).userModel!.id; //don't forget to check this when read user
    notificationList = await _notificationRepo.fetchNotification(id);
    allotmentNotificationList =
        await _notificationRepo.fetchAllotmentNotification(id);
    countUnreadNotification();
    print(notificationList);
    print(unreadNotificationCount);
    isLoading = false;
    notifyListeners();
  }

  void countUnreadNotification() {
    unreadNotificationCount = 0;

    for (var element in notificationList) {
      if (element.status == "not read") {
        unreadNotificationCount++;
      }
    }
    for (var element in allotmentNotificationList) {
      if (element.readStatus == "not read") {
        unreadNotificationCount++;
      }
    }
    notifyListeners();
  }

  Future<void> selectAllotment(
      AllotmentNotificationModel allotment, BuildContext context) async {
    selectedAllotment = allotment;
    if (allotment.readStatus != "read") {
      await updateReadStatusAppointment(allotment.appointmentId);
    }

    notifyListeners();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AppointmentDetailsPage()));
  }

  Future<void> updateReadStatusAppointment(String appointmentId) async {
    await _notificationRepo.updateReadStatusAppointment(appointmentId);
    notifyListeners();
  }

  Future<void> updateReadStatusNotification(String notificationId) async {
    await _notificationRepo.updateReadStatusNotification(notificationId);
    notifyListeners();
  }
}
