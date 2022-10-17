import 'dart:convert';

import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/auth_provider.dart';
import '../provider/slot_provider.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/wrapper.dart';

class SharedPref {
  Future<void> setData(String doctorModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = await preferences.setString('doctorModel', doctorModel);
    print(status);
  }

  Future<String?> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? doctorModel = preferences.getString('doctorModel');
    return doctorModel;
  }

  Future<void> removeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('doctorModel');
  }

  Future<void> setDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = await preferences.setInt(
        'dateTime', DateTime.now().millisecondsSinceEpoch);
    print(status);
  }

  Future<int?> getDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? dateTime = preferences.getInt('dateTime');
    return dateTime;
  }

  Future<void> authHandler(BuildContext context) async {
    String? doctorModel = await getData();
    int? dateTime = await getDate();

    if (doctorModel == null ||
        dateTime == null ||
        DateTime.now().millisecondsSinceEpoch - dateTime > 864000000) {
      removeData();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LogInPage()));
    } else {
      Provider.of<AuthProvider>(context, listen: false).doctorModel =
          DoctorModel.fromMap(json.decode(doctorModel));
      await setDate();
      Provider.of<SlotProvider>(context, listen: false)
          .fetchSingleSlot(context);
      Provider.of<SlotProvider>(context, listen: false).fetchSlots(context);
      Provider.of<NotificationProvider>(context, listen: false)
          .fetchNotification(context);
      Provider.of<SlotProvider>(context, listen: false)
          .setnextappointementdatetime();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Wrapper()));
    }
  }
}
