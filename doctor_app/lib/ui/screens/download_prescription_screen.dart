import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/comman/app_bar.dart';

class DownloadPrescriptionPage extends StatefulWidget {
  const DownloadPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<DownloadPrescriptionPage> createState() =>
      _DownloadPrescriptionPageState();
}

class _DownloadPrescriptionPageState extends State<DownloadPrescriptionPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppBar(
        context,
        'Prescription',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child:
            Consumer<PrescriptionProvider>(builder: (context, value, widget) {
          return Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.black,
                          height: size.height * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/mindsmith-logo-black.png'),
                                  ),
                                  Text(
                                    value.selectedPrescription!.doctorName,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'MBBS(AFMC), DPM PSYCHIATRY\nREG.No.3562',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 25, left: 8, right: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.mobile_screen_share_outlined,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'WhatsApp +91 9717977731',
                                          style: TextStyle(
                                            fontSize: 7,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.email,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'info.mindsmith@gmail.com',
                                          style: TextStyle(
                                            fontSize: 7,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.blur_circular_outlined,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'www.mindsmith.co.in',
                                          style: TextStyle(
                                            fontSize: 7,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: size.height * 0.65,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'DATE',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            DateFormat('dd/MM/yyyy').format(
                                              DateTime.now(),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 11),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'NAME',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            value
                                                .selectedPrescription!.userName,
                                            style:
                                                const TextStyle(fontSize: 11),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'AGE/GENDER',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                value.selectedPrescription!
                                                    .userAgeGender,
                                                style: const TextStyle(
                                                    fontSize: 11),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Text(
                                                'ID NO.',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'MS - 2211/11',
                                                style: TextStyle(fontSize: 11),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const Icon(
                                      Icons.medical_services_outlined,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      value.selectedPrescription!.userSymptoms,
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        DottedLine(
                                          lineLength: size.width * 0.38,
                                        ),
                                        const Text(
                                          '15 DAYS',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      value
                                          .selectedPrescription!.medicalHistory,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  bottom: 5,
                                ),
                                child: Text(
                                  'This is an auto-generated Prescription and does not need Signature',
                                  style: TextStyle(fontSize: 7.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 192, 184, 113),
                    height: 40,
                    endIndent: 15,
                    indent: 15,
                    thickness: 2,
                  ),
                ],
              ),
              ElevatedButton(
                  style: smallBlackButtonStyle1,
                  onPressed: () async {
                    await value.downloadPrescription(context);
                  },
                  child: const Text('Download')),
              ElevatedButton(
                  style: smallBlackButtonStyle1,
                  onPressed: () async {
                    await value.sendPdf();
                  },
                  child: const Text('Send')),
            ],
          );
        }),
      ),
    );
  }
}
