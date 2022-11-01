import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/ui/screens/help_screen.dart';
import 'package:the_mindsmith/ui/screens/privacy_policy_screen.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class CustomerSport extends StatefulWidget {
  const CustomerSport({Key? key}) : super(key: key);

  @override
  State<CustomerSport> createState() => _CustomerSportState();
}

class _CustomerSportState extends State<CustomerSport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, 'Customer Support'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: halfButtonStyle1,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HelpPage()));
                    },
                    child: Text('Help')),
                // ElevatedButton(
                //     style: halfButtonStyle1,
                //     onPressed: () {},
                //     child: Text('Ratings')),
                // ElevatedButton(
                //     style: halfButtonStyle1,
                //     onPressed: () {},
                //     child: Text('Suggestion')),
                ElevatedButton(
                    style: halfButtonStyle1,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicyPage()));
                    },
                    child: Text('Privacy Policy')),
              ],
            ),
          ),
        ));
  }
}
