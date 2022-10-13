import 'package:flutter/material.dart';

import 'dart:io';

import 'package:dio/dio.dart';

class UpdateRepo {
  Future<bool> updateDocEmail(
    String id,
    String docEmail,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_email';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_email": docEmail,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateDocName(
    String id,
    String userName,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_name';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_name": userName,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateDocNumber(
    String id,
    String num,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_number';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_name": num,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateDocSpeciality(
    String id,
    String speciality,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_speciality';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_speciality": speciality,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateDocAddress(
    String id,
    String address,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_address';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_address": address,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateDocFee(
    String id,
    String fee,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_fee';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_fee": fee,
    });

    Response response = await Dio().post(baseUrl, data: formData);

    return true;
  }

  Future<bool> updateDocExperience(
    String id,
    String exp,
  ) async {
    String baseUrl =
        'http://44.209.72.97/themindsmith/Doctorapi_controller/update_doctor_experience';
    FormData formData = FormData.fromMap({
      "doctor_id": id,
      "doctor_experience": exp,
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
