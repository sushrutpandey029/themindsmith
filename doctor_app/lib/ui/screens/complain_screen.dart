import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';

class ComplainPage extends StatefulWidget {
  const ComplainPage({Key? key}) : super(key: key);

  @override
  State<ComplainPage> createState() => _ComplainPageState();
}

class _ComplainPageState extends State<ComplainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Customer Support'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                'There is an issue in booking appointment',
                style: heading2,
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Text(
                'Some time this problem come due to some network issue, Please check the connection or the problem continues restart the app you can login and directly book the appointment which time sloy you need ( if the doctor does not mentioned that time in the slot the appointment will not book see that doctor is available )',
                style: text1,
              ),
            ),
            // Text(
            //   'Did we answer your problem ?',
            //   style: text2,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       SizedBox(
            //         width: 120,
            //         child: ElevatedButton(
            //             style: flatWhiteButton,
            //             onPressed: () {},
            //             child: Text('Yes')),
            //       ),
            //       SizedBox(
            //           width: 120,
            //           child: ElevatedButton(
            //               style: flatWhiteButton,
            //               onPressed: () {},
            //               child: Text('No'))),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 60,),
            // SizedBox(
            //   width:double.infinity,

            //   child: ElevatedButton(
            //     style: flatWhiteButton,
            //       onPressed: () {},
            //       child: Text(
            //           'If the issue not resolved yet? You can chat with us')),
            // ),
          ],
        ),
      ),
    );
  }
}
