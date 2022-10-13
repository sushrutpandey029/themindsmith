import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/ui/widgets/doctor_selection_screen_widgets/doctor_selection_card.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class DoctorSelectionPage extends StatefulWidget {
  const DoctorSelectionPage({Key? key}) : super(key: key);

  @override
  State<DoctorSelectionPage> createState() => _DoctorSelectionPageState();
}

class _DoctorSelectionPageState extends State<DoctorSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context, 'Our Experts'),
      body: Consumer<DoctorProvider>(
        builder: (context,value,widget) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  for(int i = 0 ; i<value.doctorList.length;i++)
                      DoctorSelectionCard(isChat:false, doctorModel: value.doctorList[i],index:i)
                   
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
