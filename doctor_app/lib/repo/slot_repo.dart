import 'package:dio/dio.dart';
import 'package:doctor_app/constants/url_constant.dart';
import 'package:doctor_app/model/add_slot_model.dart';
import 'package:doctor_app/model/appointment_model.dart';
import 'package:doctor_app/model/slot_model.dart';

class SlotRepo {
  final String _docApi = "$baseUrl/Doctorapi_controller";

  Future<void> addSlot(AddSlotModel addSlotModel) async {
    String url = "$_docApi/add_slot";
    Response response = await Dio().post(url, data: addSlotModel.toMap());
    print(response.toString());
  }

  Future<List<SlotModel>> fetchSlots(String docId) async {
    String url = "$_docApi/slot_list";
    Response response = await Dio().post(url, data: {"doctor_id": docId});
    List<SlotModel> list = [];
    if (response.data["All Slot"] != null) {
      for (Map<String, dynamic> map in response.data["All Slot"]) {
        SlotModel slotModel = SlotModel.fromMap(map);
        list.add(slotModel);
      }
    }
    print(list);
    return list;
  }

  Future<void> updateSlot(SlotModel slotModel) async {
    String path = "$_docApi/update_slot";
    Response response = await Dio().post(path, data: {
      "id": slotModel.id,
      "doctor_id": slotModel.doctorId,
      "doctors_name": slotModel.doctorsName,
      "schedule_date": slotModel.scheduleDate.toString().split(" ").first,
      "start_time": slotModel.startTime,
      "end_time": slotModel.endTime,
      "avg_slot_timing": slotModel.avgSlotTiming
    });

    print(response);
  }

  Future<void> deleteSlot(String slotId) async {
    String path ="$_docApi/slot_delete";
    Response response = await Dio().post(path,data: {
      "slot_id": slotId
    });
    print(response);
  }

// these api are called for appointment details don't get confuse with slot api
  Future<List<AppointmentModel>> fetchAppointment(String doctorId) async {
    List<AppointmentModel> list = [];
    String url = "$_docApi/upcoming_appointment";

    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
    print(response.data);
    if (response.data['status'] == 1) {
      for (Map<String, dynamic> map in response.data['data']) {
        // print(map);
        AppointmentModel slotModel = AppointmentModel.fromMap(map);
        list.add(slotModel);
      }
    }
    return list;
  }

  Future<AppointmentModel?> fetchSingleAppointment(String doctorId) async {
    String url = "$_docApi/single_upcoming_appointment";
    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
    if (response.data['status'] == 1) {
      // print(SlotModel.fromMap(response.data['data']));
      return AppointmentModel.fromMap(response.data['data'][0]);
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
