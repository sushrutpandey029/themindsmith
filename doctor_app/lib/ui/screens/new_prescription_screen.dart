import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/model/prescription_model.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/screens/download_prescription_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../widgets/comman/app_bar.dart';

class NewPrescriptionPage extends StatefulWidget {
  NewPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<NewPrescriptionPage> createState() => _NewPrescriptionPageState();
}

class _NewPrescriptionPageState extends State<NewPrescriptionPage> {
   final TextEditingController _emailController =TextEditingController();
    final TextEditingController _ageController =TextEditingController();
    final TextEditingController _symptomsController =TextEditingController();
    final TextEditingController _notesController =TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: customAppBar(context,"Generate New Prescription",),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
              child: Consumer<PrescriptionProvider>(
                builder: (context,value,widget) {
                  return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Patient data',
                      style: heading3,
                    ),
                  ),
                  Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: value.selectedUser!.userName,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                  ), Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: value.selectedUser!.userRegNo,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          labelText: 'Registration No.',
                          border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                  ), Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          labelText: 'Email id',
                          border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                  ), Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _ageController
                      ,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          labelText: 'Age/Sex (eg: 35/F)',
                          border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                  ), Padding(
                     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _symptomsController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          labelText: 'Symptoms',
                          border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[300],
                          filled: true,
                          labelText: 'Notes',
                          border: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              gapPadding: 2,
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent))),
                    ),
                  ),
        
                  Center(child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ElevatedButton(
                      style: smallBlackButtonStyle1,
                      onPressed: () async {
                       await  value.addPrescription(context,PrescriptionModel(doctorId: context.read<AuthProvider>().doctorModel!.doctorId, doctorName: context.read<AuthProvider>().doctorModel!.doctorName, userId: value.selectedUser!.userId,userRegNo: value.selectedUser!.userRegNo, userName: value.selectedUser!.userName, userFullName: value.selectedUser!.userName, userEmail: _emailController.text, userAgeGender: _ageController.text, userSymptoms: _symptomsController.text, medicalHistory: _notesController.text));
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => DownloadPrescriptionPage())));
                      }, child: Text('Create Prescription')),
                  ))
            ],
          );
                }
              )),
        ),
      ),
    );
  }
}
