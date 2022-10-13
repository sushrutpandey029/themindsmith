import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../../providers/doctor_provider.dart';
import '../widgets/doctor_selection_screen_widgets/doctor_selection_card.dart';

class DocSelectionChat extends StatefulWidget {
  DocSelectionChat({Key? key}) : super(key: key);

  @override
  State<DocSelectionChat> createState() => _DocSelectionChatState();
}

class _DocSelectionChatState extends State<DocSelectionChat> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Chat With Doctor'),
      body: Consumer<DoctorProvider>(
        builder: (context,value,widget) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  for(int i = 0 ; i<value.doctorList.length;i++)
                      DoctorSelectionCard(isChat: true, doctorModel: value.doctorList[i],index:i)
                   
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}