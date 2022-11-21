import 'package:dio/dio.dart';
import 'package:the_mindsmith/models/slot_model.dart';

import '../../constants/url_constant.dart';

class SlotRepo {
   final String _userApi = "$baseUrl/Userapi_controller";

   Future<List<SlotModel>> fetchSlotByDocId (String docId) async {
     List<SlotModel> list =[];
     String url = "$_userApi/slot_by_doc_id";
      Response response = await Dio().get(url,queryParameters: {"doctor_id":docId}
      );
      print(response.data);

       for(Map<String, dynamic > slotMap in response.data['data'])
      {
        // print(SlotModel.fromMap(slotMap));
        list.add(SlotModel.fromMap(slotMap));
      }
      // print(list);

    return list;
   }
}