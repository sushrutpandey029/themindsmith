

import 'package:doctor_app/model/article_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/repo/article_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../ui/screens/article_screen.dart';

class ArticlesProvider extends ChangeNotifier {

  final ArticleRepo _articleRepo = ArticleRepo();
  List<ArticleModel> articles=[];
  ArticleModel? selectedArticle;
  bool isLoading = false;

  void selectArticle (BuildContext context,int index) {
    selectedArticle = articles.elementAt(index);
    Navigator.push(context,MaterialPageRoute(builder:(context)=>ArticlePage()));
    notifyListeners();
  }

  Future<void> fetchArticles(BuildContext context) async {
    isLoading=true;

    String doctorId = Provider.of<AuthProvider>(context,listen: false).doctorModel!.doctorId;

    articles = await _articleRepo.fetchArticles(doctorId);
    isLoading=false;

    notifyListeners();
  }

}