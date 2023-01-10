import 'package:badges/badges.dart';
import 'package:doctor_app/model/appointment_model.dart';
import 'package:doctor_app/ui/screens/edit_profile_screen.dart';
import 'package:doctor_app/ui/screens/profile_screen.dart';
import 'package:intl/intl.dart';
import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/chat_provider.dart';
import 'package:doctor_app/provider/slot_provider.dart';
import 'package:doctor_app/ui/screens/about_me_screen.dart';
import 'package:doctor_app/ui/screens/patient_messages_list.dart';
import 'package:doctor_app/ui/screens/upcoming_appointment_screen.dart';
import 'package:doctor_app/ui/screens/user_listing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/date_time_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
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
                    foregroundColor: Colors.black,
                    fixedSize: const Size.fromHeight(60),
                    backgroundColor: const Color.fromARGB(255, 227, 247, 255),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(width: 2))),
                onPressed: () {
                  Provider.of<SlotProvider>(context, listen: false)
                      .fetchAppointment(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              const UpcomingAppointmentPage())));
                },
                child: const Text('My Appointments')),
          ),
        ),
        Consumer<SlotProvider>(
          builder: (context, value, widget) {
            AppointmentModel? upcomingslot;
            if (!value.isSingleLoading) {
              _runAnimation();
            }
            upcomingslot = Provider.of<SlotProvider>(context, listen: false)
                .upcomingAppointment;
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
                : value.appointmentList.isEmpty || upcomingslot == null
                    ? const Text('No Appointment for Now')
                    : InkWell(
                        onTap: () {
                          value.selectAppointment(
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
                                  upcomingslot.userName,
                                  style: text2,
                                ),
                                upcomingslot.appointmentDate == null
                                    ? const SizedBox()
                                    : Text(
                                        'Date           : ${upcomingslot?.appointmentDate ?? ' '}',
                                        style: text3),
                                upcomingslot.startedTime == null
                                    ? const SizedBox()
                                    : Text(
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
                              builder: (context) => EditProfilePage(
                                    isEditProfile: false,
                                  )));
                    },
                    child: const Text('My Profile')),
              ),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                    style: flatWhiteButton,
                    onPressed: () {
                      context.read<SlotProvider>().fetchAppointment(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const UserListing(
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
                        builder: ((context) =>
                            const PatientMessagesListPage())));
              },
              child: const Text('My Chats')),
        ),
      ],
    );
  }
}
