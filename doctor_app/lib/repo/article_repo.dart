import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:doctor_app/constants/url_constant.dart';
import 'package:doctor_app/model/article_model.dart';

class ArticleRepo {
  final String _docApi = "$baseUrl/Doctorapi_controller";

  Future<List<ArticleModel>> fetchArticles(String doctorId) async {
    String url = "$_docApi/doc_articles";
    List<ArticleModel> list = [];

    Response response = await Dio().post(url, data: {"doctor_id": doctorId});
    print(response.data);
    if (response.data['status'] == 1) {
      for (Map<String, dynamic> map in response.data['data']) {
        list.add(ArticleModel.fromMap(map));
      }
    } else {
      print(response.data);
      throw Exception([response.data['data']]);
    }
    print(list);
    return list;
  }
}
