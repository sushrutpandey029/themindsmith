import 'dart:developer';

import 'package:dio/dio.dart';

class PayoutRepo {
  Future<bool> payRequest(
      String id,
      String docName,
      String docNumber,
      String docEmail,
      String reqFee,
      String accNumber,
      String ifscCode,
      String branchName,
      String beneficiaryName) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/pay_request';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_name": docName,
      "doctor_number": docNumber,
      "doctor_email": docEmail,
      "request_fee": reqFee,
      "account_number": accNumber,
      "ifsc_code": ifscCode,
      "branch_name": branchName,
      "beneficiary_name": beneficiaryName
    });

    Response response = await Dio().post(baseUrl, data: formData);
    print(response);

    return true;
  }
}
