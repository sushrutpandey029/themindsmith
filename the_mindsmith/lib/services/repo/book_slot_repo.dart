import 'package:dio/dio.dart';
import 'package:the_mindsmith/models/book_slot_model.dart';

import '../../constants/url_constant.dart';

class BookSlotRepo {
  final String _userApi = "$baseUrl/Userapi_controller";
  Future<void> bookSlot(BookSlotModel bookSlotModel) async {
    String url = "$_userApi/book_apointment";
    Response response = await Dio().post(url, data: bookSlotModel.toMap());

    print(response.data);
  }

  Future<void> updateSlotStatus(String slotId) async {
    String url = "$_userApi/updateslotstatus";
    Response response =
        await Dio().post(url, data: {"slot_id": slotId, "status": "book"});
    print(response.data);
  }
}
