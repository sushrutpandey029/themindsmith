import 'package:flutter/material.dart';

import '../../constants/button_style.dart';
import '../widgets/comman/app_bar.dart';
import 'complain_screen.dart';
import 'help_screen.dart';

class CustomerSupportPage extends StatefulWidget {
  const CustomerSupportPage({Key? key}) : super(key: key);

  @override
  State<CustomerSupportPage> createState() => _CustomerSupportPageState();
}

class _CustomerSupportPageState extends State<CustomerSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          context,
          "Customer Support",
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: halfButtonStyle1,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ComplainPage()));
                    },
                    child: const Text('Issues')),
                ElevatedButton(
                    style: halfButtonStyle1,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HelpPage()));
                    },
                    child: const Text('Help')),
              ],
            ),
          ),
        ));
  }
}
