import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/services/repo/fcm_repo.dart';
import 'package:the_mindsmith/ui/screens/help_screen.dart';
import 'package:the_mindsmith/ui/screens/payment_policy_screen.dart';
// ignore: unused_import
import 'package:the_mindsmith/ui/screens/privacy_policy_screen.dart';
import 'package:the_mindsmith/ui/screens/tnc_screen.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';
import 'package:the_mindsmith/util/shared_pref.dart';
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
                    child: const Text('FAQs')),
                ElevatedButton(
                    style: halfButtonStyle1,
                    onPressed: () async {
                      // await FCMRepo().sendNotification(await SharedPref().getToken(),'',context);
                      Uri uri = Uri.parse("https://drive.google.com/file/d/1NLdIFej-ALW4E2h0msBj3pil_8gXNTS9/view?usp=drivesdk");
                      launchUrl(uri,mode: LaunchMode.externalNonBrowserApplication);
                      //  Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => TnCPage()));
                    },
                    child: Text('T&C')),
                ElevatedButton(
                    style: halfButtonStyle1,
                    onPressed: () {
                       Uri uri = Uri.parse("https://drive.google.com/file/d/1NSMm2EWJxJ0_bAbAiiTcG4DRGvGNa9Ec/view?usp=drivesdk");
                      launchUrl(uri,mode: LaunchMode.externalNonBrowserApplication);
                      //  Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => PaymentPolicyPage()));
                    },
                    child: Text('Payment Policy')),
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
