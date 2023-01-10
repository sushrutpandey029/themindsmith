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
  static final SharedPref _sharedPref = SharedPref._internal();
  factory SharedPref() {
    return _sharedPref;
  }
  SharedPref._internal();

  Future<void> setData(String doctorModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = await preferences.setString('doctorModel', doctorModel);
    // await preferences.setString('jwt', jwt);
    print(status.toString());
  }

  Future<String?> getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? doctorModel = preferences.getString('doctorModel');
    return doctorModel;
  }

  Future<void> removeData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('doctorModel');
    // await preferences.remove('jwt');
  }

  Future<void> setDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = await preferences.setInt(
        'dateTime', DateTime.now().millisecondsSinceEpoch);
    print(status.toString());
  }

  Future<int?> getDate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? dateTime = preferences.getInt('dateTime');
    return dateTime;
  }

  Future<bool> setToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = await preferences.setString('token', token);
    return status;
  }

  Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString('token') ?? '';
    return token;
  }

  Future<void> authHandler(BuildContext context) async {
    String? doctorModel = await getData();
    int? dateTime = await getDate();

    if (doctorModel == null ||
        dateTime == null ||
        DateTime.now().millisecondsSinceEpoch - dateTime > 864000000) {
      removeData();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LogInPage()),
        (Route<dynamic> route) => false,
      );
    } else {
      Provider.of<AuthProvider>(context, listen: false).doctorModel =
          DoctorModel.fromMap(json.decode(doctorModel));
      await setDate();
      // await Provider.of<SlotProvider>(context, listen: false)
      //     .fetchSingleAppointment(context);
      // await Provider.of<SlotProvider>(context, listen: false)
      //     .fetchAppointment(context);
      // Provider.of<NotificationProvider>(context, listen: false)
      //     .fetchNotification(context);
      // Provider.of<SlotProvider>(context, listen: false)
      //     .setNextAppointmentDateTime();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Wrapper()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
