import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/prescription_provider.dart';
import 'package:the_mindsmith/ui/screens/upload_medical_history_screen.dart';

import 'prescriptions_screen.dart';

class HealthLockerPage extends StatefulWidget {
  const HealthLockerPage({Key? key}) : super(key: key);

  @override
  State<HealthLockerPage> createState() => _HealthLockerPageState();
}

class _HealthLockerPageState extends State<HealthLockerPage> {
  @override
  Widget build(BuildContext context) {
//  Provider.of<PrescriptionProvider>(context,listen: false).fetchPrescription(context);
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(38.0),
              child: Image.asset('assets/icons/document.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
                    style: fullButtonStyleWhite,
                    onPressed: () {
                      Provider.of<PrescriptionProvider>(context, listen: false)
                          .fetchPrescription(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PrescriptionPage()));
                    },
                    child: Text(
                      'All Prescriptions',
                      style: text2,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
                    style: fullButtonStyleWhite,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const UploadMedicalHistoryPage()));
                    },
                    child: Text(
                      'Upload Medical History',
                      style: text2,
                    )),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            )
          ],
        ));
  }
}
