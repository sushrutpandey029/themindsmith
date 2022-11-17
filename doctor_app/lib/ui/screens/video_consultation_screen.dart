import 'package:agora_uikit/agora_uikit.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:doctor_app/provider/video_call_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style.dart';
import '../../provider/notification_provider.dart';
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
      appBar: customAppBar(context, null, isback: false),
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
  int createUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(100000);
  }

  Future<bool> _onWillPop(VideoCallProvider value) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: const EdgeInsets.all(30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text('Are you sure?'),
            content: const Text('Do you want to disconnect from the call'),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  await AwesomeNotifications().createNotification(
                    content: NotificationContent(
                      actionType: ActionType.Default,
                      id: createUniqueId(),
                      channelKey: 'call_channel',
                      title:
                          'Ongoing Call from ${Provider.of<NotificationProvider>(context, listen: false).selectedAllotment?.userName ?? 'caller'} ',
                      notificationLayout: NotificationLayout.Default,
                      color: Colors.teal,
                    ),
                  );
                  Navigator.of(context).pop(true);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                  await value.agoraClient?.sessionController.value.engine
                      ?.leaveChannel();
                  if (value.agoraClient!.sessionController.value.connectionData!
                      .rtmEnabled) {
                    await value
                        .agoraClient?.sessionController.value.agoraRtmChannel
                        ?.leave();
                    await value
                        .agoraClient?.sessionController.value.agoraRtmClient
                        ?.logout();
                  }
                  await value.agoraClient?.sessionController.value.engine
                      ?.destroy();
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoCallProvider>(
      builder: (context, value, widget) {
        return WillPopScope(
          onWillPop: () => _onWillPop(value),
          child: Stack(children: [
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
          ]),
        );
      },
    );
  }
}
