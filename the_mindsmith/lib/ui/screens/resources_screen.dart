import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/providers/articles_provider.dart';
import 'package:the_mindsmith/ui/widgets/article_screen_widget/atricle_widget.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({ Key? key }) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesProvider>(
      builder: (context,value,widget) {
        return Column(
          children: [ if (value.isLoading)
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                  ),
                ),
            Flexible(
              child: ListView.builder(
                itemCount: value.articlesList.length,
                padding: EdgeInsets.all(18),
                itemBuilder: (context, index) {
                  return ResourceWidget(articleModel: value.articlesList.elementAt(index),);
                
              }),
            ),
          ],
        );
      }
    );
  }
}