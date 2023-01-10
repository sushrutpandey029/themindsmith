import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/screens/appointment_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/appointment_model.dart';
import '../model/notification_model.dart';
import '../repo/notification_repo.dart';
import '../ui/screens/notification_screen.dart';
import 'auth_provider.dart';

class NotificationProvider extends ChangeNotifier {
  bool isLoading = false;
  final NotificationRepo _notificationRepo = NotificationRepo();
  List<NotificationModel> notificationList = [];
  int unreadNotificationCount = 0;
  List<AppointmentModel> appointmentNotificationList = [];
  AppointmentModel? selectedAppointment;

  Future<void> fetchNotification(BuildContext context,
      {bool isFirst = true}) async {
    if (isFirst) {
      isLoading = true;
    }
    try {
      String id = Provider.of<AuthProvider>(context, listen: false)
          .doctorModel!
          .doctorId;
      if (isFirst) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NotificationPage()));
      }

      notificationList = await _notificationRepo.fetchNotification(id);
      appointmentNotificationList =
          await _notificationRepo.fetchAppointmentNotification(id);
      isLoading = false;
      await context.read<SlotProvider>().fetchAppointment(context);
      unreadNotificationCount = 0;
      for (var element in notificationList) {
        if (element.status != "read") {
          unreadNotificationCount++;
        }
      }
      for (var element in appointmentNotificationList) {
        if (element.readStatus != "read") {
          unreadNotificationCount++;
        }
      }
      notifyListeners();
      if(!isFirst) {
        await Future.delayed(const Duration(seconds: 10), () async {
        await fetchNotification(context, isFirst: false);
      });
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  // void selectAllotment(AllotmentNotificationModel allotment,BuildContext context) {
  //   selectedAllotment = allotment;

  //   notifyListeners();
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentDetailsPage()));
  // }
  Future<void> selectAllotment(
      AppointmentModel appointment, BuildContext context) async {
    selectedAppointment = appointment;
    // if (allotment.readStatus != "read") {
    //   await updateReadStatusAppointment(allotment.appointmentId);
    // }

    notifyListeners();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const AppointmentDetailsPage()));
  }

  Future<void> updateReadStatusNotification(String notificationId) async {
    await _notificationRepo.updateReadStatusNotification(notificationId);
    if (unreadNotificationCount > 0) {
      unreadNotificationCount--;
    }
    notifyListeners();
  }
}
