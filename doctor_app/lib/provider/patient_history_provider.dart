import 'package:doctor_app/model/patient_history_model.dart';
import 'package:doctor_app/model/user_model.dart';
import 'package:doctor_app/repo/patient_history_repo.dart';
import 'package:doctor_app/util/error_dialogue.dart';
import 'package:flutter/material.dart';

class PatientHistoryProvider extends ChangeNotifier {
  UserModel? user;
  final PatientHistoryRepo _historyRepo= PatientHistoryRepo();
  
  void selectUser (UserModel userModel) {
    user=userModel;
    notifyListeners();
  }

  Future<void> addHistory(BuildContext context,PatientHistoryModel patientHistory) async {
     showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator()));
    String response =await _historyRepo.addHistory(patientHistory);
    Navigator.pop(context);
    errorDialogue(context: context,  message: response);
  }

}