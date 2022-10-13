import 'package:dio/dio.dart';
import 'package:the_mindsmith/models/chat_model.dart';

import '../../constants/url_constant.dart';

class ChatRepo {
  final String _userApi = "$baseUrl/Userapi_controller";
  final String _docApi = "$baseUrl/Doctorapi_controller";
  Future<void> sendMessage(String userId, String userName, String doctorId, String doctorName , String message) async {
     String url = "$_userApi/user_chat_with_doc";
     Response response =  await Dio().post(url, data: {
      "user_id" : userId,
      "user_name": userName,
      "doctor_id": doctorId,
      "doctor_name":doctorName,
      "text_message": message
      });
      print(response.data);
  }

  Future<List<ChatModel>> fetchDoctorChat(String doctorId) async {
    String url = "$_docApi/doc_show_msg";
    List<ChatModel> list = [];

    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
if(response.data["txt_msg"]!=null) {
  for (Map<String, dynamic> element in response.data["txt_msg"]) {
      list.add(ChatModel.fromMap(element));
    }
}
    // print(list);

    return list;
  }

  Future<List<ChatModel>> fetchUserChat(String userId) async {
    List<ChatModel> list = [];
    String url = "$_userApi/user_show_msg";

    Response response = await Dio().post(url, data: {"user_id": userId});
    // print(userId);
    // print(response);
    if(response.data["txt_msg"]!=null) {
      for (Map<String, dynamic> element in response.data["txt_msg"]) {
      list.add(ChatModel.fromMap(element));
    }
    }
    // print(list);

    return list;
  }
}
