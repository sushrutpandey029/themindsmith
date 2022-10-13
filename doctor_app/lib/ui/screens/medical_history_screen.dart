import 'package:doctor_app/constants/text_style.dart';
import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class MedicalHistoryPage extends StatefulWidget {
  MedicalHistoryPage({Key? key}) : super(key: key);

  @override
  State<MedicalHistoryPage> createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"Medical History",),
    body: Center(
      child: Container(
        decoration:BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(2,2),
              blurRadius: 2
            )
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),

        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text('Previous medical Prescriptions',style: text2,),
        ),
      ),
    ),
    );
  }
}