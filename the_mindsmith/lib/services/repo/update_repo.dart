import 'dart:io';

import 'package:dio/dio.dart';

class UpdateRepo {
  Future<bool> updateUserEmail(
    String id,
    String userEmail,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Userapi_controller/update_user_email';
    FormData formData = FormData.fromMap({
      "user_id": id,
      "user_email": userEmail,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateUserName(
    String id,
    String userName,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Userapi_controller/update_user_name';
    FormData formData = FormData.fromMap({
      "user_id": id,
      "user_name": userName,
    });

    Response response = await Dio().post(baseUrl, data: formData);
    print(response);

    return true;
  }

  Future<bool> updateUserAge(
    String id,
    String userAge,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Userapi_controller/update_user_age';
    FormData formData = FormData.fromMap({
      "user_id": id,
      "user_age": userAge,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> uploadImage(String id, File file) async {
    String fileName = file.path.split('/').last;
    String baseUrl =
        'http://44.209.72.97/themindsmith/Userapi_controller/update_user_image';
    FormData formData = FormData.fromMap({
      "user_id": id,
      "update_image":
          await MultipartFile.fromFile(file.path, filename: fileName),
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }
}
