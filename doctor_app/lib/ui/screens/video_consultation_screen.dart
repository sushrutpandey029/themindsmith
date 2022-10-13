import 'package:agora_uikit/agora_uikit.dart';
import 'package:doctor_app/provider/video_call_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_style.dart';
import '../../constants/text_style.dart';
import '../widgets/comman/app_bar.dart';

class VideoConsultationPage extends StatefulWidget {
  const VideoConsultationPage({ Key? key }) : super(key: key);

  @override
  State<VideoConsultationPage> createState() => _VideoConsultationPageState();
}

class _VideoConsultationPageState extends State<VideoConsultationPage> {
  bool test = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,null),
      body: test?AgoraVideoCall():
      Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            
            child: Image.asset('assets/images/doctor3.png',fit: BoxFit.cover,height: 200,width: 200,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Dr. Rakesh',style: heading2,),
          ),
          Text('psychiatrist, Mumbai',style: text3,),
          Text('(MBBS, MD) NIMHANS',style: text3,),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Image.asset('assets/images/video-camera.png',height: 100,color: Colors.grey[400],)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIcon(AssetImage('assets/icons/mute.png'),size: 35,),
                  
              
             ImageIcon(AssetImage('assets/icons/end-call.png'),size: 35,),
            ],
          )
        ],
      ),
      
    );
  }
}


class AgoraVideoCall extends StatefulWidget {
  AgoraVideoCall({Key? key}) : super(key: key);

  @override
  State<AgoraVideoCall> createState() => _AgoraVideoCallState();
}

class _AgoraVideoCallState extends State<AgoraVideoCall> {

  // Instantiate the client
// final AgoraClient client = AgoraClient(
  
//   agoraConnectionData: AgoraConnectionData(
//     appId: "ac27b4adf1a04c6db93f6335fae17609",
//     channelName: "channelName",
//     tempToken: "006ac27b4adf1a04c6db93f6335fae17609IACPQOo91027fCpR10nbOXCvrPK9Y6arm3m/sDw2vuv+0wYf3+7MTbZkIgBFIoxr8DK7YgQAAQCA77liAgCA77liAwCA77liBACA77li"
//   ),
// );

// void initAgora() async {
//   await client.initialize();
// }





// @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }
  @override
  Widget build(BuildContext context) {
    
    return Consumer<VideoCallProvider>(
     
      builder: (context, value, widget) {
        return Stack(
              children: [
                AgoraVideoViewer(client: value.agoraClient!), 
                AgoraVideoButtons(client: value.agoraClient!,
                // disconnectButtonChild: IconButton(onPressed: (){Navigator.pop(context);},icon:Icon(Icons.call_end)),),
             )]);
      },
    );
  }
}