import 'package:flutter/cupertino.dart';
import 'package:the_mindsmith/services/repo/articles_repo.dart';

import '../models/article_model.dart';



class ArticlesProvider extends ChangeNotifier {
  final ArticlesRepo _articlesRepo = ArticlesRepo();
  List<ResourceModel> articlesList=[];
  bool isLoading = false;
  Future<void> fetchArticles() async {
    isLoading=true;
    notifyListeners();
    articlesList = await _articlesRepo.fetchArticles();
    isLoading=false;
    notifyListeners();
  }
}