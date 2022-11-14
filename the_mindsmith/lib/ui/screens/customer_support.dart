import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/ui/screens/help_screen.dart';
// ignore: unused_import
import 'package:the_mindsmith/ui/screens/privacy_policy_screen.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

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
                    child: const Text('Help')),
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PrivacyPolicyPage()));
                      launchUrl(
                          Uri.parse(
                              'https://drive.google.com/file/d/12G6R3auEPP49dwsqN-D8VBAunUjFkiG9/view?usp=share_link'),
                          mode: LaunchMode.externalNonBrowserApplication);
                    },
                    child: const Text('Privacy Policy')),
              ],
            ),
          ),
        ));
  }
}
