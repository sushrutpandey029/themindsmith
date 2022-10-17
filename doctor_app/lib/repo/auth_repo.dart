import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/url_constant.dart';

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

      // print(response.data);
      return response.data;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    String url = "$_doctorApi/doc_logout";
    Response response = await Dio().get(url);
    print(response.data);
  }
}
