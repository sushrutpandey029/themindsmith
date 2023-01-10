import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              'Welcome to The MindSmith',
              textAlign: TextAlign.center,
              style: heading2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Text(
              'India\'s most premium and safe channel for Brain, Behaviour and Emotional Health',
              textAlign: TextAlign.center,
            ),
          ),

          Image(
            image: const AssetImage('assets/images/mindsmith-logo.png'),
            height: size.height * 0.18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: fullButtonStyleWhite,
                onPressed: () {
                  Provider.of<DoctorProvider>(context, listen: false)
                      .fetchDoctor(context, false);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:18.0),
                  child: Center(
                      child: Text(
                    'Book an Appointment',
                    style: text1,
                  )),
                )),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: ElevatedButton(
          //             style: halfButtonStyle,
          //             onPressed: () async {
          //               Provider.of<DoctorProvider>(context, listen: false)
          //                   .fetchDoctor(context, false);
          //             },
          //             child: Center(
          //                 child: Text(
          //               'Book First Consultation',
          //               style: text1,
          //             ))),
          //       ),
          //     ),
          //     Expanded(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: ElevatedButton(
          //             style: halfButtonStyle,
          //             onPressed: () {
          //               Provider.of<NotificationProvider>(context,
          //                       listen: false)
          //                   .fetchNotification(context);
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: ((context) =>
          //                           const ConsulationPage())));
          //             },
          //             child: Center(
          //                 child: Text(
          //               'Book Follow-up Consultation',
          //               style: text1,
          //             ))),
          //       ),
          //     )
          //   ],
          // ),

          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20, offset: Offset(5, 5))
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                        'Choose from across 10+ specialties in \nBrain Medicine and Therapy',
                        textAlign: TextAlign.center),
                  ),
                  // const Spacer(),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => ConsultNowPage()));
                  //   },
                  //   child: Container(
                  //     height: 60,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: const BoxDecoration(
                  //         color: Colors.black,
                  //         borderRadius: BorderRadius.vertical(
                  //             bottom: Radius.circular(20))),
                  //     child: const Center(
                  //         child: Text(
                  //       'Consult now',
                  //       style: TextStyle(color: Colors.white),
                  //     )),
                  //   ),
                  // )
                  // Container(
                  //   height: 60,
                  //   width: MediaQuery.of(context).size.width,
                  //   decoration: const BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius:
                  //           BorderRadius.vertical(bottom: Radius.circular(20))),
                  //   child: const Center(
                  //       child: Text(
                  //     'Consult now',
                  //     style: TextStyle(color: Colors.white),
                  //   )),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
