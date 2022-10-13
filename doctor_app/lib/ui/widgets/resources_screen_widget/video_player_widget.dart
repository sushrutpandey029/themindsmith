import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);
  String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    String videoId =
        YoutubePlayer.convertUrlToId(widget.videoUrl)!;
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
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.black,
        ),
      ),
    );
  }
}
