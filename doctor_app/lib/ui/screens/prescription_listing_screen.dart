import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/screens/patient_history_screen.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:doctor_app/util/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'download_prescription_screen.dart';

class PrescriptionListingPage extends StatefulWidget {
  const PrescriptionListingPage({Key? key, required this.isHistoryPage})
      : super(key: key);
  final bool isHistoryPage;
  @override
  State<PrescriptionListingPage> createState() =>
      _PrescriptionListingPageState(isHistoryPage);
}

class _PrescriptionListingPageState extends State<PrescriptionListingPage> {
  bool isHistoryPage;
  _PrescriptionListingPageState(this.isHistoryPage);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Prescriptions'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child:
            Consumer<PrescriptionProvider>(builder: (context, value, widget) {
          return Column(
            children: [
              if (value.isLoading)
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      )),
                ),
              Flexible(
                child: ListView.builder(
                    itemCount: value.prescriptionList.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          onTap: () {
                            value.selectPrescription(
                                value.prescriptionList.elementAt(index));
                            isHistoryPage
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const PatientHistoryPage())))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const DownloadPrescriptionPage())));
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          title: Text(value.prescriptionList
                                  .elementAt(index)
                                  .pclientid ??
                              ''),
                          trailing: Text(formateDate(
                              value.prescriptionList.elementAt(index).date ??
                                  "")),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(value.prescriptionList
                                  .elementAt(index)
                                  .userFullName),
                              Text(value.prescriptionList
                                  .elementAt(index)
                                  .notes),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ],
          );
        }),
      ),
    );
  }
}
