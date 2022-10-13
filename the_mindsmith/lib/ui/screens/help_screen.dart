import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../widgets/common/hide_show_widget.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Help"),
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
                      child: HideShowWidget(title: 'Topic 1', data: 'this is help instruction for the first Topic. hope you like it')
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Topic 2', data: 'this is help instruction for the second Topic. hope you like it')
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Topic 3', data: 'this is help instruction for the third Topic. hope you like it')
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HideShowWidget(title: 'Topic 4', data: 'this is help instruction for the fourth Topic. hope you like it')
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
