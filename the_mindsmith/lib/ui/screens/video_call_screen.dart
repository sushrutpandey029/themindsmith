import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/video_call_provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({Key? key}) : super(key: key);

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  bool test = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, null),
      body: test
          ? const AgoraVideoCall()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.grey[300],
                      height: MediaQuery.of(context).size.height / 3,
                      child: Center(child: Text('Doctor', style: heading2))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[300],
                    height: MediaQuery.of(context).size.height / 3,
                    child: Center(
                        child: Text(
                      'Patient',
                      style: heading2,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ImageIcon(
                        AssetImage('assets/icons/mute.png'),
                        size: 35,
                      ),
                      ImageIcon(
                        AssetImage('assets/icons/end-call.png'),
                        size: 35,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class AgoraVideoCall extends StatefulWidget {
  const AgoraVideoCall({
    Key? key,
  }) : super(key: key);
  // AllotmentNotificationModel selectedAllotment;

  @override
  State<AgoraVideoCall> createState() => _AgoraVideoCallState();
}

class _AgoraVideoCallState extends State<AgoraVideoCall> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoCallProvider>(
      builder: (context, value, widget) {
        return Stack(
          children: [
            AgoraVideoViewer(
              client: value.agoraClient!,
              disabledVideoWidget: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/mindsmith-logo.png',
                  ),
                ),
              ),
            ),
            AgoraVideoButtons(
              client: value.agoraClient!,
            ),
          ],
        );
      },
    );
  }
}
