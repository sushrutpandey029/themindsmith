import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/user_prescription_model.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/services/repo/prescription_repo.dart';
import 'package:the_mindsmith/util/error_dialogue.dart';


class PrescriptionProvider extends ChangeNotifier {
  String? path;
  String? fileName;
  List<UserPrescriptionModel> prescriptionModel = [];
  final PrescriptionRepo _prescriptionRepo = PrescriptionRepo();
  bool isLoading = false;

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

  Future<void> uploadPrescription(BuildContext context, String remarks) async {
    String userId = Provider.of<AuthProvider>(context, listen: false)
        .userResponse!['user_id'];
    String userName = Provider.of<AuthProvider>(context, listen: false)
        .userResponse!['user_name'];
    showDialog(
        context: context,
        builder: (context) => const Center(child: const CircularProgressIndicator()));
    if (path != null && remarks.isNotEmpty) {
      String response = await _prescriptionRepo.uploadPrescription(
          userId, userName, path!, remarks);
      Navigator.pop(context);
      errorDialogue(context: context, title: "success!!", message: response);
    } else {
      Navigator.pop(context);
      errorDialogue(
          context: context,
          title: "empty field !!",
          message: "please provide the file and remarks.");
    }
  }

  Future<void> fetchPrescription(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    String userId = Provider.of<AuthProvider>(context, listen: false)
        .userResponse!['users']['id'];

    prescriptionModel = await _prescriptionRepo.fetchPrescription(userId);
    isLoading = false;
    notifyListeners();

    // Navigator.push(context, MaterialPageRoute(builder: (context)=> PrescriptionPage()));
  }
}
