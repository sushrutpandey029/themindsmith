import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../constants/url_constant.dart';

class AchievementRepo {
  final String _doctorApi = "$baseUrl/Doctorapi_controller";
  Future<String> uploadAchievement(String doctorId, String doctorName,
      String filePath, BuildContext context) async {
    String url = "$_doctorApi/add_doc_achivements";
    String fileName = filePath.split('/').last;
    FormData formData = FormData.fromMap({
      'doctor_id': doctorId,
      'doctor_name': doctorName,
      'achivement': await MultipartFile.fromFile(filePath, filename: fileName),
    });

    try {
      Response response = await Dio()
          .post(url, data: formData, options: Options(followRedirects: false));

      // print(response);
      return response.data!;
    } on DioError catch (e) {
      print(e.response);
      print(e.message);
      rethrow;
    }
  }
}
