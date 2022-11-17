import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/provider/notification_provider.dart';
import 'package:doctor_app/repo/auth_repo.dart';
import 'package:doctor_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/screens/login_screen.dart';
import '../ui/screens/wrapper.dart';
import '../util/error_dialogue.dart';
import 'slot_provider.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepo _authApi = AuthRepo();
  DoctorModel? doctorModel;
  final SharedPref _pref = SharedPref();

  Future<void> loginWithEmail(
      String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      Map<String, dynamic> response =
          await _authApi.loginWithEmail(email, password);

      if (response['status'] == 1) {
        if (response['jwt'] != null) {
          // print(res['users']['user_name']);
          String jwt = response['jwt'];
          Map<String, dynamic> map = await _authApi.readDoc(jwt);
          // print(map);
          doctorModel = DoctorModel.fromMap(map['users']);

          print(doctorModel);
          await _pref.setData(json.encode(doctorModel?.toMap()));
          await _pref.setDate();
          notifyListeners();

          Provider.of<SlotProvider>(context, listen: false)
              .fetchSingleSlot(context);
          Provider.of<SlotProvider>(context, listen: false).fetchSlots(context);
          Provider.of<NotificationProvider>(context, listen: false)
              .fetchNotification(context);

          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: ((context) => const Wrapper())),
            (Route<dynamic> route) => false,
          );
        }
      } else {
        Navigator.pop(context);
        errorDialogue(context: context, message: response['message']);
      }
    } on DioError catch (e) {
      Navigator.pop(context);
      errorDialogue(context: context, message: e.message);
    }
  }

  Future<void> logOut(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    await _authApi.logOut();
    doctorModel = null;
    await _pref.removeData();
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LogInPage()),
        (route) =>
            route.isCurrent ==
            MaterialPageRoute(builder: (context) => const LogInPage()));
    notifyListeners();
  }
}
