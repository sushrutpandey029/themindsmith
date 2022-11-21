import 'package:dio/dio.dart';
import 'package:doctor_app/constants/url_constant.dart';
import 'package:doctor_app/model/slot_model.dart';

class SlotRepo {
  final String _docApi = "$baseUrl/Doctorapi_controller";

  Future<List<SlotModel>> fetchSlots(String doctorId) async {
    List<SlotModel> list = [];
    String url = "$_docApi/upcoming_appointment";

    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
    print(response.data);
    if (response.data['status'] == 1) {
      for (Map<String, dynamic> map in response.data['data']) {
        // print(map);
        SlotModel slotModel = SlotModel.fromMap(map);
        list.add(slotModel);
      }
    }
    return list;
  }

  Future<SlotModel?> fetchSingleSlot(String doctorId) async {
    String url = "$_docApi/single_upcoming_appointment";
    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
    if (response.data['status'] == 1) {
      // print(SlotModel.fromMap(response.data['data']));
      return SlotModel.fromMap(response.data['data'][0]);
    }
    return null;
  }

  Future<void> updateReadStatus(String appointmentId) async {
    String url = "$baseUrl/Userapi_controller/update_appointment_status";
    print(url);
    try {
      Response response = await Dio().post(url,
          data: {"appointment_id": appointmentId, "read_status": "read"});
      print(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
  }
}
