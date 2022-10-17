import 'package:agora_uikit/agora_uikit.dart';
import 'package:doctor_app/model/slot_model.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class VideoCallProvider extends ChangeNotifier {
  AgoraClient? agoraClient;
  Future<void> connectCall(BuildContext context) async {
    SlotModel selectedSlot =
        Provider.of<SlotProvider>(context, listen: false).selectedSlot!;
    // await agoraClient.initialize();
    AgoraClient agoraClient = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
            appId: 'ac27b4adf1a04c6db93f6335fae17609',
            channelName:
                //  "test",
                selectedSlot.slotId,
            uid: int.parse(selectedSlot.doctorsId),
            tempToken: selectedSlot.videoToken
            // "006ac27b4adf1a04c6db93f6335fae17609IAAcEPr4pJw4wrNj88p7Ggwg0vyT9WLYJboztVt/DHWOiAx+f9gAAAAAEADYPDyUt3i9YgEAAQC2eL1i006ac27b4adf1a04c6db93f6335fae17609IAAcEPr4pJw4wrNj88p7Ggwg0vyT9WLYJboztVt/DHWOiAx+f9gAAAAAEADYPDyUt3i9YgEAAQC2eL1i006ac27b4adf1a04c6db93f6335fae17609IAAcEPr4pJw4wrNj88p7Ggwg0vyT9WLYJboztVt/DHWOiAx+f9gAAAAAEADYPDyUt3i9YgEAAQC2eL1i"
            ));
    agoraClient.initialize();
    this.agoraClient = agoraClient;
    notifyListeners();
  }
}
