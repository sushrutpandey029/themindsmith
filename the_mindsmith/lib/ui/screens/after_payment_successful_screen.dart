import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/ui/screens/video_consultation_screen.dart';
import 'package:the_mindsmith/ui/widgets/consult_doctor_screen_widgets/doctor_clinic_widget.dart';
import 'package:the_mindsmith/ui/widgets/consult_doctor_screen_widgets/doctor_profile_widget.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../widgets/consult_doctor_screen_widgets/slot_selection_widget.dart';

class AfterPaymentSuccessfulPage extends StatefulWidget {
  const AfterPaymentSuccessfulPage({ Key? key }) : super(key: key);

  @override
  State<AfterPaymentSuccessfulPage> createState() => _AfterPaymentSuccessfulPageState();
}

class _AfterPaymentSuccessfulPageState extends State<AfterPaymentSuccessfulPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, null),
      body: Padding(padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.asset('assets/images/doctor3.png',fit: BoxFit.fill,height: 180,width:160,),
            Column(
              children: [
                Text('Dr. Rakesh',style: heading2,),
                Text('psychiatrist, Mumbai'),
                Text('(MBBS, MD) NIMHANS'),
              ],
            )
          ],),
        
          Padding(
            padding: const EdgeInsets.only(top:48.0,left: 18,right: 18,bottom: 9),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(style:fullButtonStyle, onPressed : (){}, child: Text('Uplode medical history'))),
          ), Padding(
            padding: const EdgeInsets.only(top:9.0,left: 18,right: 18,bottom: 9),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(style:fullButtonStyle, onPressed : (){
                Navigator.of(context).push(MaterialPageRoute(builder: ((context) => VideoConsultationPage())));
              }, child: Text('Online Video Consultation'))),
          ),
          Text('Click here to join video call with doctor',style: TextStyle(color: Colors.grey),)
         
        ],
      ),),
    );
  }
}