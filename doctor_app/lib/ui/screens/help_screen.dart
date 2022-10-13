import 'package:doctor_app/ui/widgets/comman/hide_show_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({ Key? key }) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"Help",),
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