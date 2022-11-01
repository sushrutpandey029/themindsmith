import 'package:agora_uikit/agora_uikit.dart';
import 'package:doctor_app/provider/video_call_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style.dart';
import '../widgets/comman/app_bar.dart';

class VideoConsultationPage extends StatefulWidget {
  const VideoConsultationPage({Key? key}) : super(key: key);

  @override
  State<VideoConsultationPage> createState() => _VideoConsultationPageState();
}

class _VideoConsultationPageState extends State<VideoConsultationPage> {
  bool test = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, null),
      body: test
          ? const AgoraVideoCall()
          : Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/doctor3.png',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Dr. Rakesh',
                    style: heading2,
                  ),
                ),
                Text(
                  'psychiatrist, Mumbai',
                  style: text3,
                ),
                Text(
                  '(MBBS, MD) NIMHANS',
                  style: text3,
                ),
                Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Image.asset(
                      'assets/images/video-camera.png',
                      height: 100,
                      color: Colors.grey[400],
                    )),
                Row(
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
                )
              ],
            ),
    );
  }
}

class AgoraVideoCall extends StatefulWidget {
  const AgoraVideoCall({Key? key}) : super(key: key);

  @override
  State<AgoraVideoCall> createState() => _AgoraVideoCallState();
}

class _AgoraVideoCallState extends State<AgoraVideoCall> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoCallProvider>(
      builder: (context, value, widget) {
        return Stack(children: [
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
            // disconnectButtonChild: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.call_end)),),
          )
        ]);
      },
    );
  }
}
