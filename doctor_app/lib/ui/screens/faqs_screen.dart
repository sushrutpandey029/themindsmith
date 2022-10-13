import 'package:doctor_app/ui/widgets/comman/hide_show_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({ Key? key }) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"FAQ'S",),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              children: [
                
                // SizedBox(height: 40,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Question 1', data: 'this is the answer of the first question. hope you like it')
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Question 2', data: 'this is the answer of the second question. hope you like it')
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Question 3', data: 'this is the answer of the third question. hope you like it')
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Question 4', data: 'this is the answer of the fourth question. hope you like it')
                    ),
                    
                    
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}