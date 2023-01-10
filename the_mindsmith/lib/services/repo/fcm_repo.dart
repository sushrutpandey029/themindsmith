import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/providers/slot_provider.dart';

import '../../models/slot_model.dart';
import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';

class FCMRepo {
  Future<void> sendNotification(
      String userToken, String docToken, BuildContext context) async {
    SlotModel slotModel =
        Provider.of<SlotProvider>(context, listen: false).selectedSlot!;
    UserModel userModel =
        Provider.of<AuthProvider>(context, listen: false).userModel!;
    String path = "https://fcm.googleapis.com/fcm/send";
    String auth =
        "key=AAAAyUwJmFU:APA91bHQFOlgiIn5UAkF8jo7z2zI1votH-UCPdVDmrVBfybNJ4ZltvWOWwfEi1ZMMo6AaHy-tWSaVE-8IdW-KXstkqlVdP3UwwxRLvLdKYYt8phiXzgSOBR-Ls3N1tedbRIsPwTSpFed";

    await Dio().post(
      path,
      options: Options(
          contentType: "application/json",
          headers: {HttpHeaders.authorizationHeader: auth}),
      data: {
        "to": userToken,
        "priority": "high",
        "notification": {
          "title": "Appointment Booked",
          "body":
              "Your appointment has been booked with ${slotModel.doctorsName} on ${slotModel.scheduleDate} at ${slotModel.startTime}"
        },
        "data": {
          "scheduledDate": slotModel.scheduleDate,
          "scheduledTime": slotModel.startTime,
          "docName": slotModel.doctorsName,
        }
      },
    );

    await Dio().post(
      path,
      options: Options(
          contentType: "application/json",
          headers: {HttpHeaders.authorizationHeader: auth}),
      data: {
        "to": docToken,
        "priority": "high",
        "notification": {
          "title": "New Appointment",
          "body":
              "You have a new appointment with ${userModel.userName} on ${slotModel.scheduleDate} at ${slotModel.startTime}"
        },
        "data": {
          "scheduledDate": slotModel.scheduleDate,
          "scheduledTime": slotModel.startTime,
          "userName": userModel.userName,
        }
      },
    );

//     Response response =    await Dio().post(path,
//     options: Options(
//       contentType: "application/json",
//       headers : {
//         HttpHeaders.authorizationHeader : auth
//       }
//     ),
//     data: {
//       "to": userToken,
//       "priority": "high",
//       "notification": {
//         "title": "Upcoming Appointment",
//         "body": "Your appointment with ${slotModel.doctorsName} is on ${slotModel.scheduleDate} at ${slotModel.startTime}"
//       },
//       "data": {
//         "isScheduled": "true",
//         "scheduledTime": "${slotModel.scheduleDate} ${slotModel.startTime}"
//       }
//     },);

//     await Dio().post(path,
//     options: Options(
//       contentType: "application/json",
//       headers : {
//         HttpHeaders.authorizationHeader : auth
//       }
//     ),
//     data: {
//       "to": docToken,
//       "priority": "high",
//       "notification": {
//         "title": "Upcoming Appointment",
//         "body": "Your appointment with ${userModel.userName} is on ${slotModel.scheduleDate} at ${slotModel.startTime}"
//       },
//       "data": {
//         "isScheduled": "true",
//         "scheduledTime": "${slotModel.scheduleDate} ${slotModel.startTime}"
//       }
//     },);
// print(response.data);
  }
}
