import 'package:dio/dio.dart';
import 'package:the_mindsmith/models/doctor_model.dart';

import '../../constants/url_constant.dart';

class DoctorRepo {
  final String _doctorApi = "$baseUrl/Doctorapi_controller";
  Future<List<DoctorModel>> fetchDoctors() async {
    List<DoctorModel> list = [];

    String url = "$_doctorApi/alldoctors";

    Response response = await Dio().get(url);
    for (Map<String, dynamic> doctorMap in response.data['AllDoctors']) {
      list.add(DoctorModel.fromMap(doctorMap));
    }
    // print(list);

    return list;
  }
}
