import 'package:dio/dio.dart';
import 'package:the_mindsmith/models/user_prescription_model.dart';

import '../../constants/url_constant.dart';

class PrescriptionRepo {
  final String _userApi = "$baseUrl/Userapi_controller";

  Future<String> uploadPrescription(
      String userId, String userName, String filePath, String remarks) async {
    String url = "$_userApi/add_user_prescription";
    String fileName = filePath.split('/').last;
    FormData formData = FormData.fromMap({
      'user_id': userId,
      'user_name': userName,
      'remark': remarks,
      "file": await MultipartFile.fromFile(filePath, filename: fileName),
    });

    Response response = await Dio().post(url, data: formData);

    print(response);
    return response.data!;
  }

  Future<List<UserPrescriptionModel>> fetchPrescription(String userId) async {
    String path = "$_userApi/list_user_prescription";
    List<UserPrescriptionModel> list = [];
    Response response = await Dio().post(path, data: {"user_id": userId});
    print(response.data);
    if (response.data["status"] == 1)
      for (Map<String, dynamic> prescriptionMap in response.data["data"]) {
        list.add(UserPrescriptionModel.fromMap(prescriptionMap));
      }
    print(list);
    return list;
  }
}
