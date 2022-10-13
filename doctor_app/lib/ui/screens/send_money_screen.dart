//unused code

import 'package:doctor_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class SendMoneyPage extends StatefulWidget {
  SendMoneyPage({Key? key}) : super(key: key);

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ImageIcon(AssetImage('assets/icons/previous.png'))),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Image.asset(
                'assets/images/mindsmith-logo.png',
                width: 40,
              ),
            ),
            Text('Send Money'),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Amount',
                style: text3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()),
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()),
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide()))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
