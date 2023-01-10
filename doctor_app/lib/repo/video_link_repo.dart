import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doctor_app/constants/url_constant.dart';

class VideoLinkRepo {
  final String _doctorApi = "$baseUrl/Doctorapi_controller";

  Future<List<String>> fetchLink(doctorId) async {
    String url = "$_doctorApi/doc_show_videolink";

    Response response = await Dio().post(url);
    print(response);
    List<String> list = [];

    if (response.data['status'] == 1) {
      for (Map<String, dynamic> link in response.data['data']) {
        list.add(link['video_link']);
      }
    } else {
      print(response.data['message']);
      return [response.data['message']];
    }
    print(list);
    return list;
  }
}
