import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doctor_app/model/doctor_model.dart';

import '../constants/url_constant.dart';
import '../util/shared_pref.dart';

class AuthRepo {
  final String _doctorApi = "$baseUrl/Doctorapi_controller";
  Future<Map<String, dynamic>> loginWithEmail(
      String email, String password) async {
    String url = "$_doctorApi/login";
    try {
      Response response = await Dio().post(
        url,
        data: {"doctor_email": email, "doctor_password": password},
      );

      return response.data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> readDoc(String jwt) async {
    String url = "$_doctorApi/readdoc";
    try {
      final response = await Dio()
          .post(url, options: Options(headers: {"Authorization": jwt}));

      print(response.data);
      return response.data;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }


 Future<DoctorModel?> getDoc(String docId) async {
  String path = "$_doctorApi/getdoc";
  Response response = await Dio().post(path,data: {
    "doctor_id": docId
  });
  if(response.data["data"][0]!=null) {
    print(DoctorModel.fromMap(response.data["data"][0]));
  
    return DoctorModel.fromMap(response.data["data"][0]);
  }
 }

  Future<void> logOut() async {
    String url = "$_doctorApi/doc_logout";
    Response response = await Dio().get(url);
    print(response.data);
  }

  Future<void> updateFCMToken(String docId) async {
    String path = "$_doctorApi/update_doctor_pushtoken";
    String fcmToken= await SharedPref().getToken();
   Response response = await  Dio().post(path, data: {"doc_id": docId, "pushtoken": fcmToken});
   print("see here"+response.data.toString());
  }
}
