import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/video_link_provider.dart';
import 'package:doctor_app/ui/widgets/resources_screen_widget/video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/comman/app_bar.dart';
import 'send_money_screen.dart';

class VideoLinksPage extends StatefulWidget {
  VideoLinksPage({Key? key}) : super(key: key);

  @override
  State<VideoLinksPage> createState() => _VideoLinksPageState();
}

class _VideoLinksPageState extends State<VideoLinksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Videos",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Consumer<VideoLinkProvider>(
            builder: (context, value, widget) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  if (value.isLoading)
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ),
                  Flexible(
                    child: ListView.builder(
                        itemCount: value.videoLink.length,
                        itemBuilder: ((context, index) {
                          return VideoPlayerWidget(videoUrl: value.videoLink.elementAt(index));
                        })),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
