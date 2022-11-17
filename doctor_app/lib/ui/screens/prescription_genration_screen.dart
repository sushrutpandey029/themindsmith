//not in use

import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/screens/new_prescription_screen.dart';
import 'package:doctor_app/ui/screens/prescription_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/comman/app_bar.dart';

class PrescriptionGenrationPage extends StatefulWidget {
  const PrescriptionGenrationPage({Key? key}) : super(key: key);

  @override
  State<PrescriptionGenrationPage> createState() =>
      _PrescriptionGenrationPageState();
}

class _PrescriptionGenrationPageState extends State<PrescriptionGenrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Prescription Generation",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: fullButtonStyleWhite,
                  onPressed: () {
                    context
                        .read<PrescriptionProvider>()
                        .fetchPrescription(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrescriptionListingPage(
                                  isHistoryPage: false,
                                )));
                  },
                  child: const Text('Old Prescription')),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: fullButtonStyleWhite,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const NewPrescriptionPage())));
                  },
                  child: const Text('Generate New Prescription')),
            ),
          ],
        ),
      ),
    );
  }
}
