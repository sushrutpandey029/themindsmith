import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/notification_model.dart';
import '../repo/notification_repo.dart';
import '../ui/screens/notification_screen.dart';
import 'auth_provider.dart';

class NotificationProvider extends ChangeNotifier {
  bool isLoading = false;
  NotificationRepo _notificationRepo = NotificationRepo();
  List<NotificationModel> notificationList = [];
  int unreadNotificationCount = 0;
  // List<AllotmentNotificationModel> allotmentNotificationList =[];
  // AllotmentNotificationModel? selectedAllotment;

  Future<void> fetchNotification(BuildContext context) async {
    unreadNotificationCount =0;
    isLoading=true;
    String id =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    // showDialog(
    //     context: context,
    //     builder: (context) => Center(child: CircularProgressIndicator()));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NotificationPage()));
    notificationList = await _notificationRepo.fetchNotification(id);
    isLoading=false;
    for (var element in notificationList) {
      if(element.status!="read") {
        unreadNotificationCount++;
      }
    }
    // Navigator.pop(context);
    // allotmentNotificationList = await _notificationRepo.fetchAllotmentNotification(id);
    notifyListeners();
    
  }

  // void selectAllotment(AllotmentNotificationModel allotment,BuildContext context) {
  //   selectedAllotment = allotment;

  //   notifyListeners();
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>AppointmentDetailsPage()));
  // }
   Future<void> updateReadStatusNotification(String notificationId) async {
    await _notificationRepo.updateReadStatusNotification(notificationId);
    if(unreadNotificationCount>0) {
      unreadNotificationCount--;
    }
    notifyListeners();

  }
}
