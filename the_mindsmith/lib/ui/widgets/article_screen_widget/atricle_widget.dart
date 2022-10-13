import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/article_model.dart';

class ResourceWidget extends StatefulWidget {
  ResourceWidget({Key? key, required this.articleModel}) : super(key: key);
  ResourceModel articleModel;

  @override
  State<ResourceWidget> createState() => _ResourceWidgetState();
}

class _ResourceWidgetState extends State<ResourceWidget> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    String videoId =
        YoutubePlayer.convertUrlToId(widget.articleModel.articleLink)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId, //Add videoID.
      flags: YoutubePlayerFlags(
        hideControls: false,
        controlsVisibleAtStart: true,
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 20,
       shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:18,vertical: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.articleModel.articleDescription.length > 40
                      ? '${widget.articleModel.articleDescription.substring(0, 40)}....'
                      : widget.articleModel.articleDescription,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
