import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../util/error_dialogue.dart';

class AgoraTokenRepo {
  Future<String?> generateToken(String channelName,int userId,BuildContext context) async {
    String url = "https://mindsmith.herokuapp.com/rtc/$channelName/publisher/uid/0/?expiry=";
    try {
  Response response = await Dio().get(url);
  print(response.data);
  print(response.data["rtcToken"]);
  return response.data["rtcToken"];
} on DioError catch (e) {

  errorDialogue(message: e.message,context: context,title: e.type.toString());
}
  }
}