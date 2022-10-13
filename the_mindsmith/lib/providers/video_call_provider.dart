import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/appointment_notification_model.dart';

import 'notification_provider.dart';

class VideoCallProvider extends ChangeNotifier {
  AgoraClient? agoraClient;
  Future<void> connectCall(BuildContext context) async {
    AllotmentNotificationModel selectedAllotment =
        Provider.of<NotificationProvider>(context, listen: false)
            .selectedAllotment!;
    // await agoraClient.initialize();
    AgoraClient agoraClient = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          uid: int.parse(selectedAllotment.userId),
            appId: 'ac27b4adf1a04c6db93f6335fae17609',
            channelName: 
            // "test",
            selectedAllotment.slotId,
            tempToken: 
            selectedAllotment.videoToken
                // "006ac27b4adf1a04c6db93f6335fae17609IAAcEPr4pJw4wrNj88p7Ggwg0vyT9WLYJboztVt/DHWOiAx+f9gAAAAAEADYPDyUt3i9YgEAAQC2eL1i"
                ));
     agoraClient.initialize();
    this.agoraClient = agoraClient;
    notifyListeners();
  }
}
