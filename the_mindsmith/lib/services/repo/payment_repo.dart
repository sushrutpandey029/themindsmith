import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:dio/dio.dart';

class PaymentRepo {
  Future<bool> saveCustomerDoctorData(
    String id,
    String uRegNumber,
    String uName,
    String uNumber,
    String uEmail,
    String dId,
    String dName,
    String dNumber,
    String dEmail,
    String dFee,
    String tId,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Userapi_controller/user_payment';
    FormData formData = FormData.fromMap({
      "user_id": id,
      "user_reg_no": uRegNumber,
      "user_name": uName,
      "user_number": uNumber,
      "user_email": uEmail,
      "doctor_id": dId,
      "doctor_name": dName,
      "doctor_number": dNumber,
      "doctor_email": dEmail,
      "doctor_fee": dFee,
      "transaction_id": "hjasv32y62323vhwgd67267"
    });

    try {
  Response response = await Dio().post(baseUrl, data: formData);
} on DioError catch (e) {
  print(e);
}

    return true;
  }
}
