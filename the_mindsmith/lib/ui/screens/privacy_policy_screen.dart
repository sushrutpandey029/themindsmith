import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class PrivacyPolicyPage extends StatefulWidget {
  PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Privacy Policy"),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              'Our Privacy Policy',
              style: heading2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'this is our privacy policy',
              style: text1,
            ),
          ],
        ),
      ),
    );
  }
}
