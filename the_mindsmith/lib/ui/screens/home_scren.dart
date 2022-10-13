import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/services/repo/doctor_repo.dart';
import 'package:the_mindsmith/ui/screens/chat_screen.dart';

import '../../providers/notification_provider.dart';
import 'consulation_screen.dart';
import 'consult_now_screen.dart';
import 'doctor_selection_screen.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          // TextField(
          //   decoration: InputDecoration(
          //     contentPadding: EdgeInsets.only(left: 8),
          //     filled: true,
          //     fillColor: Colors.grey[400],
          //     border: OutlineInputBorder(
          //         borderSide: BorderSide.none,
          //         borderRadius: BorderRadius.circular(20)),
          //     hintText: 'Search',
          //     hintStyle: TextStyle(color: Colors.white),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Text(
              'Welcome to The MindSmith Community',
              textAlign: TextAlign.center,
              style: heading2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Text(
              'India\'s most premium and safe channel for Mental Health and Addiction Consultation',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:halfButtonStyle,
                      onPressed: () async {
                        Provider.of<DoctorProvider>(context, listen: false)
                            .fetchDoctor(context, false);
                      },
                      child: Center(
                          child: Text(
                        'Book First Consultation',
                        style: text1,
                      ))),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: halfButtonStyle,
                      onPressed: () {
                        Provider.of<NotificationProvider>(context,
                              listen: false)
                          .fetchNotification(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ConsulationPage())));
                      },
                      child: Center(
                          child: Text(
                        'Book Follow-up Consultation',
                        style: text1,
                      ))),
                ),
              )
            ],
          ),
         
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [const BoxShadow(blurRadius: 10, offset: Offset(5, 5))],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 28.0, bottom: 8, left: 8, right: 8),
                    child: Text(
                      'Consult India\'s Top Doctors and Experts from Home',
                      textAlign: TextAlign.center,
                      style: heading2,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Choose from across 10+ specialities in Brain Medicine and Therapy',
                        textAlign: TextAlign.center),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsultNowPage()));
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20))),
                      child: const Center(
                          child: Text(
                        'Consult now',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
