import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:doctor_app/ui/widgets/upcomin_appointment_screen_widget/appointment_bar_widget.dart';
import 'package:doctor_app/util/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingAppointmentPage extends StatefulWidget {
  const UpcomingAppointmentPage({Key? key}) : super(key: key);

  @override
  State<UpcomingAppointmentPage> createState() =>
      _UpcomingAppointmentPageState();
}

class _UpcomingAppointmentPageState extends State<UpcomingAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, 'Upcoming Appointments'),
        body: Padding(
            padding: const EdgeInsets.all(18),
            child: Consumer<SlotProvider>(builder: (context, value, child) {
              return Column(
                children: [
                  if (value.isLoading)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(color: Colors.black),
                        ),
                      ),
                    ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        value.fetchSlots(context);
                      },
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.slotList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                if (index == 0 ||
                                    value.slotList[index - 1].appointmentDate
                                            .split(' ')
                                            .first !=
                                        value.slotList[index].appointmentDate
                                            .split(' ')
                                            .first)
                                  Text(
                                      formateDate(value.slotList
                                          .elementAt(index)
                                          .appointmentDate),
                                      style: text2),
                                AppointmentBarWidget(
                                  name: value.slotList[index].userName,
                                  time: value.slotList[index].startedTime,
                                  index: index,
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                ],
              );
            })));
  }
}



//  Column(
//           children: [
//             Text('monday',style: text3),Text('24/04/2022',style: text3),
//           ],
//         ),