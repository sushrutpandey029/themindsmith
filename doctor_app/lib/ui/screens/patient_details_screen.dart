import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/provider/video_call_provider.dart';
import 'package:doctor_app/ui/screens/medical_history_screen.dart';
import 'package:doctor_app/ui/screens/video_consultation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/date_time_helper.dart';
import '../widgets/comman/app_bar.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({Key? key}) : super(key: key);

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Patient Details",
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Consumer<SlotProvider>(
            builder: (context, value, widget) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    child: Image.asset('assets/images/user2.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 38.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //           Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Padding(
                            //     padding: const EdgeInsets.symmetric(vertical:28.0),
                            //     child: Text(formateDate(value.selectedAllotment!.appointmentDate),style: text2,),
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Hi ${value.selectedSlot!.doctorName},',
                                style: heading2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Your Appointment with ${value.selectedSlot!.userName} is booked successfully and Scheduled on ${formateDate(value.selectedSlot!.appointmentDate)} at  ${formateTime(value.selectedSlot!.startedTime)} for ${value.selectedSlot!.timeSlot}.',
                                style: text2,
                              ),
                            ),

                            const Divider(
                              height: 30,
                              thickness: 2,
                              color: Color.fromARGB(200, 0, 0, 0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Thanks & Regards',
                                style: text6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'The MindSmith',
                                style: text6,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: smallBlackButtonStyle1,
                      onPressed:
                          compareDate(value.selectedSlot!.appointmentDate)
                              ? () async {
                                  await Provider.of<VideoCallProvider>(context,
                                          listen: false)
                                      .connectCall(context, true);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const VideoConsultationPage())));
                                }
                              : null,
                      child: const Text('Join Call')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: smallBlackButtonStyle1,
                        onPressed: () {
                          // AgoraTokenRepo().generateToken('channelName', 'userId');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const MedicalHistoryPage())));
                        },
                        child: const Text('Medical History')),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
