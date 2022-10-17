import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repo/achievement_repo.dart';
import '../util/error_dialogue.dart';
import 'auth_provider.dart';

class AchievementProvider extends ChangeNotifier {
  String? path;
  String? fileName;
  final AchievementRepo _achievementRepo = AchievementRepo();

  Future<void> selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile platformFile = result.files.single;
      File file = File(platformFile.path!);
      fileName = platformFile.name;
      path = file.path;
      // print();
      notifyListeners();
    } else {
      // User canceled the picker
      print('user canceled');
    }
  }

  Future<void> uploadPrescription(
    BuildContext context,
  ) async {
    String doctorId =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    String doctorName = Provider.of<AuthProvider>(context, listen: false)
        .doctorModel!
        .doctorName;
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    if (path != null) {
      try {
        String response = await _achievementRepo.uploadAchievement(
            doctorId, doctorName, path!, context);
        print(response);
        Navigator.pop(context);
        errorDialogue(context: context, message: response);
      } on DioError catch (e) {
        Navigator.pop(context);
        errorDialogue(context: context, message: e.response!.data['message']);
      }
    } else {
      Navigator.pop(context);
      errorDialogue(context: context, message: "please provide the file.");
    }
  }
}
