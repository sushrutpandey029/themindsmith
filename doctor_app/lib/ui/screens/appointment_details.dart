import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/notification_provider.dart';
import 'package:doctor_app/ui/screens/video_consultation_screen.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_style.dart';
import '../../util/date_time_helper.dart';

class AppointmentDetailsPage extends StatefulWidget {
  const AppointmentDetailsPage({Key? key}) : super(key: key);

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Appointment Detail'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Consumer<NotificationProvider>(
            builder: (context, value, widget) {
              return Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Material(
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
                                'Hi ${value.selectedAllotment!.doctorName},',
                                style: heading2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Your Appointment with ${value.selectedAllotment!.userName} is booked successfully and Scheduled on ${formateDate(value.selectedAllotment!.appointmentDate)} at  ${formateTime(value.selectedAllotment!.startedTime)} for ${value.selectedAllotment!.timeSlot}.',
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
                                style: text4,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'The MindSmith',
                                style: text4,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 58.0),
                      child: ElevatedButton(
                          style: smallBlackButtonStyle1,
                          onPressed: compareDate(
                                  value.selectedAllotment!.appointmentDate)
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const VideoConsultationPage()),
                                    ),
                                  );
                                }
                              : null,
                          child: Text(
                            'Join Call',
                            style: heading3,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                          style: smallBlackButtonStyle1,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Upload Medical History',
                              style: heading3,
                            ),
                          )),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
