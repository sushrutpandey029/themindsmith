import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/model/article_model.dart';
import 'package:doctor_app/provider/articles_provider.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/url_constant.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Articles"),
      body: Consumer<ArticlesProvider>(builder: (context, value, widget) {
        return Padding(
          padding: EdgeInsets.all(18),
          child: Consumer<ArticlesProvider>(
            builder: (context, value, widget) {
              return Column(
                children: [
                  if (value.isLoading)
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          )),
                    ),
                  Flexible(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        for (int index = 0;
                            index < value.articles.length;
                            index++)
                          InkWell(
                            onTap: () {
                              Provider.of<ArticlesProvider>(context,
                                      listen: false)
                                  .selectArticle(context, index);
                            },
                            child: Card(
                                margin: EdgeInsets.all(12),
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        '$imgUrl/${value.articles.elementAt(index).docImage}',
                                        fit: BoxFit.fill,
                                            height: 100,
                                            width: 100,
                                        errorBuilder:
                                            (context, object, stackTrace) {
                                          return Image.asset(
                                            'assets/images/doctor1.png',
                                            fit: BoxFit.fill,
                                            height: 100,
                                            width: 100,
                                          );
                                        },
                                      ),

                                      Text(value.articles.elementAt(index).docName,style: text2,
                                        
                                      )
                                    ],
                                  ),
                                )),
                          )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
