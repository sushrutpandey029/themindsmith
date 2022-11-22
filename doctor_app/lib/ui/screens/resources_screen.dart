import 'package:doctor_app/provider/articles_provider.dart';
import 'package:doctor_app/provider/video_link_provider.dart';
import 'package:doctor_app/ui/screens/articles_list.dart';
import 'package:doctor_app/ui/screens/upload_achievement_screen.dart';
import 'package:doctor_app/ui/screens/video_links_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const UploadAchievementsScreen())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('Upload Achivements'),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Provider.of<ArticlesProvider>(context, listen: false)
                          .fetchArticles(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ArticleListPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('Articles'),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(12),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    onTap: () {
                      Provider.of<VideoLinkProvider>(context, listen: false)
                          .fetchLink(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => VideoLinksPage())));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    title: const Text('Videos'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
