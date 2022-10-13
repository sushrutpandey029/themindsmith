import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/appointment_notification_model.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/providers/video_call_provider.dart';
import 'package:the_mindsmith/ui/screens/video_call_screen.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class VideoConsultationPage extends StatefulWidget {
  const VideoConsultationPage({Key? key}) : super(key: key);

  @override
  State<VideoConsultationPage> createState() => _VideoConsultationPageState();
}

class _VideoConsultationPageState extends State<VideoConsultationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context, null),
      body: Consumer<NotificationProvider>(
       
        builder: (context, value,widget) {
          // DoctorModel doctorModel = Provider.of<DoctorProvider>(context,listen: false).doctorList.where((element) => element.doctorId==value.selectedAllotment!.doctorsId,).first;
          return Column(
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
                  value.selectedAllotment!.doctorName,
                  style: heading2,
                ),
              ),
              Text(
                value.selectedAllotment!.userName,
                style: text3,
              ),
              Text(
                value.selectedAllotment!.timeSlot,
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
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/mute.png'),
                    size: 35,
                  ),
                  ElevatedButton(
                      style: smallBlackButtonStyle,
                      onPressed: () async{
                        await Provider.of<VideoCallProvider>(context,listen: false).connectCall(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => VideoCallPage())));
                      },
                      child: Text('Join Call')),
                  ImageIcon(
                    AssetImage('assets/icons/end-call.png'),
                    size: 35,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
