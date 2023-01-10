import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doctor_app/constants/url_constant.dart';
import 'package:doctor_app/model/prescription_model.dart';

class PrescriptionRepo {
  final String _doctorApi = "$baseUrl/Doctorapi_controller";

  Future<void> addPrescription(PrescriptionModel prescriptionModel) async {
    String url = "$_doctorApi/add_user_prescriptions_by_doc";
    Response response = await Dio().post(url, data: prescriptionModel.toMap());

    print(response.data);
  }

  Future<List<PrescriptionModel>> fetchPrescription(String doctorId) async {
    String url = "$_doctorApi/old_prescription_list";
    List<PrescriptionModel> list = [];
    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
    if (response.data['status'] == 1) {
      for (Map<String, dynamic> map in response.data['data']) {
        list.add(PrescriptionModel.fromMap(map));
      }
    }
    // log(response.data.toString());
    return list;
  }
}
