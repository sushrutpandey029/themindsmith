import 'package:agora_uikit/agora_uikit.dart';
import 'package:doctor_app/model/slot_model.dart';
import 'package:doctor_app/provider/notification_provider.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/appointment_notification_model.dart';

class VideoCallProvider extends ChangeNotifier {
  AgoraClient? agoraClient;
  Future<void> connectCall(BuildContext context, bool ispatientdetail) async {
    if (ispatientdetail) {
      SlotModel selectedSlot =
          Provider.of<SlotProvider>(context, listen: false).selectedSlot!;

      AgoraClient agoraClient = AgoraClient(
          agoraConnectionData: AgoraConnectionData(
        appId: 'ac27b4adf1a04c6db93f6335fae17609',
        channelName: selectedSlot.slotId,
        uid: int.parse(selectedSlot.doctorsId),
        tempToken: selectedSlot.videoToken,
        username: selectedSlot.userName,
      ));
      agoraClient.initialize();
      this.agoraClient = agoraClient;
      notifyListeners();
    } else {
      AllotmentNotificationModel selectedAllotment =
          Provider.of<NotificationProvider>(context, listen: false)
              .selectedAllotment!;

      AgoraClient agoraClient = AgoraClient(
          agoraConnectionData: AgoraConnectionData(
        appId: 'ac27b4adf1a04c6db93f6335fae17609',
        channelName: selectedAllotment.slotId,
        uid: int.parse(selectedAllotment.doctorsId),
        tempToken: selectedAllotment.videoToken,
        username: selectedAllotment.userName,
      ));
      agoraClient.initialize();
      this.agoraClient = agoraClient;
      notifyListeners();
    }
  }
}
