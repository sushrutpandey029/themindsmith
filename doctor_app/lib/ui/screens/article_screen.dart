import 'package:doctor_app/constants/url_constant.dart';
import 'package:doctor_app/provider/articles_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/comman/app_bar.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({Key? key}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,null,),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Consumer<ArticlesProvider>(
         
          builder: (context, value,widget) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '$imgUrl/${value.selectedArticle!.docImage}',
                    height: 250,
                     errorBuilder: (context,object,stackTrace){
                          return Image.asset('assets/images/doctor1.png',
                          fit: BoxFit.fill,
                      height: 250,
                      width: 250,);
                      },
                  ),
                ),
                 Align(
                  alignment: Alignment.centerRight,
                   child: IconButton(onPressed: (){
                        Share.share(value.selectedArticle!.description);
                      }, icon: Icon(Icons.share)),
                 ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
                  child: Text(value.selectedArticle!.description),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
