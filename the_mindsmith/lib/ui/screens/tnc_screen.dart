import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class TnCPage extends StatefulWidget {
  TnCPage({Key? key}) : super(key: key);

  @override
  State<TnCPage> createState() => _TnCPageState();
}

class _TnCPageState extends State<TnCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "T&C"),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text('Terms & Conditions of using Mindsmith:',style: heading2,)
        ],
      ),
    );
  }
}