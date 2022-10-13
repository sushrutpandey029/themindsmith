//unused file see the design


import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/ui/screens/id_verification_screen.dart';

import '../../constants/button_style.dart';
import '../../constants/input_decoration.dart';

class AskDetailsPage extends StatefulWidget {
  const AskDetailsPage({Key? key}) : super(key: key);

  @override
  State<AskDetailsPage> createState() => _AskDetailsPageState();
}

class _AskDetailsPageState extends State<AskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30,
            ),
            Text('The MindSmith', style: heading1),
            Image.asset(
              'assets/images/brain.png',
              width: 60,
            ),
            Image.asset(
              'assets/images/hospital-bed.png',
              width: 140,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to healthy life',
                  style: heading1,
                ),
                Text(
                    'certified doctors, home delivery of medicines, NABL accerdited labs and more'),
              ],
            ),
            TextField(
              decoration: inputDecoration1('Name', null),
            ),
            TextField(
              decoration: inputDecoration1('Age', null),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width / 2.4),
                        primary: Colors.white,
                        onPrimary: Colors.grey),
                    onPressed: () {},
                    child: Text('Male')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: Size.fromWidth(
                            MediaQuery.of(context).size.width / 2.4),
                        primary: Colors.white,
                        onPrimary: Colors.grey),
                    onPressed: () {},
                    child: Text('Female')),
              ],
            ),
            TextField(
              decoration: inputDecoration1('Enter email ID', null),
            ),
            TextField(
              decoration: inputDecoration1('Referral code (optional)', null),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                style: fullButtonStyle,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => IdVerificationPage()));
                },
                child: Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
