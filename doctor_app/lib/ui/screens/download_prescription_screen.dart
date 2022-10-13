import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/comman/app_bar.dart';

class DownloadPrescriptionPage extends StatefulWidget {
  DownloadPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<DownloadPrescriptionPage> createState() =>
      _DownloadPrescriptionPageState();
}

class _DownloadPrescriptionPageState extends State<DownloadPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        'Prescription',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child:
              Consumer<PrescriptionProvider>(builder: (context, value, widget) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Patient's Name: ${value.selectedPrescription?.userName}",
                              style: text2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Registration NO: ${value.selectedPrescription?.userRegNo}",
                              style: text2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Age/Sex: ${value.selectedPrescription?.userAgeGender}",
                              style: text2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Symptoms: ${value.selectedPrescription?.userSymptoms}",
                              style: text2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              "Notes: ${value.selectedPrescription?.medicalHistory}",
                              style: text2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(value.selectedPrescription!.doctorName
                                  ,
                                  style: text2,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: smallBlackButtonStyle1,
                    onPressed: () async {
                     await value.downloadPrescription(context);
                    },
                    child: Text('Download')),
                ElevatedButton(
                    style: smallBlackButtonStyle1,
                    onPressed: () async {
                      await value.sendPdf();
                    },

                    child: Text('Send')),
              ],
            );
          }),
        ),
      ),
    );
  }
}
