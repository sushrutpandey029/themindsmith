import 'package:badges/badges.dart';
import 'package:doctor_app/model/slot_model.dart';
import 'package:intl/intl.dart';
import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/chat_provider.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/repo/slot_repo.dart';
import 'package:doctor_app/ui/screens/about_me_screen.dart';
import 'package:doctor_app/ui/screens/chat_screen.dart';
import 'package:doctor_app/ui/screens/patient_history_screen.dart';
import 'package:doctor_app/ui/screens/patient_messages_list.dart';
import 'package:doctor_app/ui/screens/prescription_genration_screen.dart';
import 'package:doctor_app/ui/screens/upcoming_appointment_screen.dart';
import 'package:doctor_app/ui/screens/user_listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../util/date_time_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000));

  void _runAnimation() async {
    for (int i = 0; i < 6; i++) {
      await _animationController.forward();
      await _animationController.reverse();
    }
  }

  @override
  void initState() {
    super.initState();

    print(now.hour.toString() +
        ":" +
        now.minute.toString() +
        ":" +
        now.second.toString());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  DateTime now = DateTime.now();
  dynamic currentTime = DateFormat.jm().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    _runAnimation();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Badge(
            elevation: 8,
            badgeColor: Colors.black,
            badgeContent:
                Consumer<SlotProvider>(builder: (context, value, widget) {
              return Text(value.unReadAppointment.toString(),
                  style: const TextStyle(color: Colors.white));
            }),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(60),
                    elevation: 10,
                    primary: const Color.fromARGB(255, 227, 247, 255),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 2))),
                onPressed: () {
                  Provider.of<SlotProvider>(context, listen: false)
                      .fetchSlots(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => UpcomingAppointmentPage())));
                },
                child: const Text('Upcoming Appointment')),
          ),
        ),
        Consumer<SlotProvider>(
          builder: (context, value, widget) {
            if (!value.isSingleLoading) {
              _runAnimation();
            }
            SlotModel? upcomingslot =
                Provider.of<SlotProvider>(context, listen: false).upcomingslot;
            return value.isSingleLoading
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ),
                  )
                : value.slotList.isEmpty
                    ? const Text('No Appointment for Now')
                    : InkWell(
                        onTap: () {
                          value.selectSlot(
                            context,
                            -1,
                          );
                          // print(value.slotList);
                        },
                        child: Column(
                          children: [
                            RotationTransition(
                                turns: Tween(begin: 0.0, end: -.06)
                                    .chain(CurveTween(curve: Curves.elasticIn))
                                    .animate(_animationController),
                                child: const Icon(
                                  Icons.alarm,
                                  size: 60,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Next Scheduled Appointment',
                                style: text2,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  upcomingslot?.userName ??
                                      'No upcoming appointment',
                                  style: text2,
                                ),
                                Text(
                                    'Date           : ${upcomingslot?.appointmentDate ?? ' '}',
                                    style: text3),
                                Text(
                                    'Start time  : ${formateTime(upcomingslot?.startedTime ?? ' ')}',
                                    style: text3),
                              ],
                            ),
                          ],
                        ),
                      );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100.0, bottom: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 160,
                child: ElevatedButton(
                    style: flatWhiteButton,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutMePage()));
                    },
                    child: const Text('My Profile')),
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                    style: flatWhiteButton,
                    onPressed: () {
                      context.read<SlotProvider>().fetchSlots(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => UserListing(
                                    title: 'Patient History',
                                  ))));
                    },
                    child: const Text('Patient History')),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 160,
          child: ElevatedButton(
              style: flatWhiteButton,
              onPressed: () {
                Provider.of<ChatProvider>(context, listen: false)
                    .fetchReceivedChat(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PatientMessagesListPage())));
              },
              child: const Text('My Chats')),
        ),
      ],
    );
  }
}
