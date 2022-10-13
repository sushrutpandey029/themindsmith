import 'package:dio/dio.dart';
import 'package:doctor_app/model/patient_history_model.dart';

import '../constants/url_constant.dart';

class PatientHistoryRepo {
  Future<String> addHistory (PatientHistoryModel patientHistoryModel) async {
    String url= "$baseUrl/Doctorapi_controller/patient_history";
    Response response =await Dio().post(url,data: patientHistoryModel.toMap());
    return response.data;
  }
}