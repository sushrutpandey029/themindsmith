import 'package:dio/dio.dart';


import '../../constants/url_constant.dart';
import '../../models/article_model.dart';


class ArticlesRepo {
  final String _articlesApi = "$baseUrl/Articles_api_controller";
  Future<List<ResourceModel>> fetchArticles () async {
    List<ResourceModel> list = [];
   String url = "$_articlesApi/AllArticles";
    Response response = await Dio().get(url);

    for(Map<String,dynamic> articlesMap in response.data["AllArticles"])
    {
      list.add(ResourceModel.fromMap(articlesMap));
    }
    print(list);
    return list;
  }
}