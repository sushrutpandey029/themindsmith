import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../../constants/button_style.dart';
import '../../constants/text_style.dart';
import '../../providers/doctor_provider.dart';

class ConsultNowPage extends StatefulWidget {
  ConsultNowPage({Key? key}) : super(key: key);

  @override
  State<ConsultNowPage> createState() => _ConsultNowPageState();
}

class _ConsultNowPageState extends State<ConsultNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Consult Now'),
      body: Padding(padding: EdgeInsets.all(18),child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text('The MindSmith', style: heading1),
            Image.asset(
              'assets/images/brain.png',
              width: 60,
            ),
            Image.asset(
              'assets/images/hospital-bed.png',
              width: 140,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: halfButtonStyle,
                        onPressed: () async {
                          

                          Provider.of<DoctorProvider>(context,listen: false).fetchDoctor(context,false);
                         
                        },
                        child: Center(
                            child: Text(
                          'Next Available Appointment',
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
                           Provider.of<DoctorProvider>(context,listen: false).fetchDoctor(context,false);
                        },
                        child: Center(child: Text('Most Inexpensive Appointment',style: text1,))),
                  ),
                )
              ],
            ),
             Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: halfButtonStyle,
                        onPressed: () {
                           Provider.of<DoctorProvider>(context,listen: false).fetchDoctor(context,false);
                        },
                        child: Center(
                            child: Text(
                          'Urgent Appointment',
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
                           Provider.of<DoctorProvider>(context,listen: false).fetchDoctor(context,true);
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatPage()));
                        },
                        child: Center(child: Text('Ask a Question',style: text1,))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),),
    );
  }
}