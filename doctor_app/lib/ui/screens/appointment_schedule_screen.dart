import 'package:doctor_app/constants/text_style.dart';
import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class AppointmentSchedulePage extends StatefulWidget {
  AppointmentSchedulePage({Key? key}) : super(key: key);

  @override
  State<AppointmentSchedulePage> createState() =>
      _AppointmentSchedulePageState();
}

class _AppointmentSchedulePageState extends State<AppointmentSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"Appointment Schedule",),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Start Date = 3/6/22',style: text4,),
                  )),
                Container(
                   color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Start Time = 06:30',style: text4,),
                  ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0,bottom: 48),
              child: Container(
                 color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Interval = 15',style: text4,),
                )),
            ),
            Image.asset('assets/images/appointment-shedule.png')
          ],
        ),
      ),
    );
  }
}
