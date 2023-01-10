import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class PaymentPolicyPage extends StatefulWidget {
  PaymentPolicyPage({Key? key}) : super(key: key);

  @override
  State<PaymentPolicyPage> createState() => _PaymentPolicyPageState();
}

class _PaymentPolicyPageState extends State<PaymentPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "T&C"),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text('Payment Policies Mindsmith:',style: heading2,)
        ],
      ),
    );
  }
}