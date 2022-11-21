import 'dart:io';

import 'package:doctor_app/model/prescription_model.dart';
import 'package:doctor_app/model/user_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/repo/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescriptionProvider extends ChangeNotifier {
  UserModel? selectedUser;
  final PrescriptionRepo _prescriptionRepo = PrescriptionRepo();
  PrescriptionModel? selectedPrescription;
  List<PrescriptionModel> prescriptionList = [];
  bool isLoading = false;
  pw.Document? _pdf;

  void selectUser(UserModel user) {
    selectedUser = user;
    notifyListeners();
  }

  Future<void> addPrescription(
      BuildContext context, PrescriptionModel prescriptionModel) async {
    selectPrescription(prescriptionModel);
    await _prescriptionRepo.addPrescription(prescriptionModel);
  }

  void selectPrescription(PrescriptionModel prescription) {
    selectedPrescription = prescription;
    notifyListeners();
  }

  Future<void> fetchPrescription(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    prescriptionList.clear();
    String doctorId = context.read<AuthProvider>().doctorModel!.doctorId;
    List<PrescriptionModel> list =
        await _prescriptionRepo.fetchPrescription(doctorId);
    for (PrescriptionModel prescription in list) {
      if (prescription.userId == selectedUser!.userId) {
        prescriptionList.add(prescription);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> downloadPrescription(BuildContext context) async {
    await generatePdf();
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/${selectedPrescription!.userName}.pdf");
    await file.writeAsBytes(await _pdf!.save());
    OpenFile.open(file.path);
  }

  Future<void> sendPdf() async {
    await generatePdf();
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/${selectedPrescription!.userName}.pdf");
    await file.writeAsBytes(await _pdf!.save());

    final MailOptions mailOptions = MailOptions(
      body:
          'Dear Sir/Madam\nPlease find Your prescription attached with this mail.\nThanks & Regards\nTheMindSmith',
      subject: 'Prescription | TheMindSmith',
      recipients: [selectedPrescription!.userEmail],
      attachments: [
        file.path,
      ],
    );

    final MailerResponse response = await FlutterMailer.send(mailOptions);
    print(response);
  }

  Future<void> generatePdf() async {
    _pdf = pw.Document();
    final image = pw.MemoryImage(
      (await rootBundle.load('assets/images/mindsmith-logo-black.png'))
          .buffer
          .asUint8List(),
    );

    _pdf!.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(0),
        build: (pw.Context context) {
          return pw.Stack(
            alignment: pw.Alignment.bottomCenter,
            children: [
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 1,
                    child: pw.Container(
                      color: PdfColors.black,
                      child: pw.Column(
                        mainAxisSize: pw.MainAxisSize.max,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            children: [
                              pw.Image(image),
                              pw.Text(
                                selectedPrescription!.doctorName,
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(8.0),
                                child: pw.Text(
                                  selectedPrescription!.doctorQualification,
                                  style: const pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                                bottom: 25, left: 8, right: 8),
                            child: pw.Column(
                              children: [
                                pw.Row(
                                  children: [
                                    // pw.Icon(

                                    //  Icons.mobile_screen_share_outlined,
                                    //   color: Colors.white,
                                    //   size: 10,
                                    // ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Text(
                                      'WhatsApp +91 9717977731',
                                      style: const pw.TextStyle(
                                        fontSize: 11,
                                        color: PdfColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    // pw.Icon(
                                    //   pw.Icons.email,
                                    //   color: Colors.white,
                                    //   size: 10,
                                    // ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Text(
                                      'info.mindsmith@gmail.com',
                                      style: const pw.TextStyle(
                                        fontSize: 11,
                                        color: PdfColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                pw.Row(
                                  children: [
                                    //  pw. Icon(
                                    //     Icons.blur_circular_outlined,
                                    //     color: Colors.white,
                                    //     size: 10,
                                    //   ),
                                    pw.SizedBox(
                                      width: 5,
                                    ),
                                    pw.Text(
                                      'www.mindsmith.co.in',
                                      style: const pw.TextStyle(
                                        fontSize: 11,
                                        color: PdfColors.white,
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
                  pw.Expanded(
                    flex: 2,
                    child: pw.SizedBox(
                      // height: size.height * 0.65,
                      child: pw.Column(
                        mainAxisSize: pw.MainAxisSize.max,
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Padding(
                            padding:
                                const pw.EdgeInsets.only(left: 12, right: 12),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: pw.Row(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      pw.Text(
                                        'DATE',
                                        style: pw.TextStyle(
                                          fontSize: 15,
                                          fontWeight: pw.FontWeight.bold,
                                        ),
                                      ),
                                      pw.SizedBox(
                                        width: 15,
                                      ),
                                      pw.Text(
                                        selectedPrescription!.date!,
                                        style: const pw.TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: pw.Row(
                                    children: [
                                      pw.Text(
                                        'NAME',
                                        style: pw.TextStyle(
                                          fontSize: 15,
                                          fontWeight: pw.FontWeight.bold,
                                        ),
                                      ),
                                      pw.SizedBox(
                                        width: 15,
                                      ),
                                      pw.Text(
                                        selectedPrescription!.userName,
                                        style: const pw.TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Row(
                                        children: [
                                          pw.Text(
                                            'AGE/GENDER',
                                            style: pw.TextStyle(
                                              fontSize: 15,
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                          pw.SizedBox(
                                            width: 8,
                                          ),
                                          pw.Text(
                                            selectedPrescription!.userAgeGender,
                                            style: const pw.TextStyle(
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      pw.Row(
                                        children: [
                                          pw.Text(
                                            'ID NO.',
                                            style: pw.TextStyle(
                                              fontSize: 15,
                                              fontWeight: pw.FontWeight.bold,
                                            ),
                                          ),
                                          pw.SizedBox(
                                            width: 8,
                                          ),
                                          pw.Text(
                                            selectedPrescription!.pclientid!,
                                            style: const pw.TextStyle(
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                pw.SizedBox(
                                  height: 20,
                                ),
                                pw.Text(
                                  'Symptoms',
                                  style: pw.TextStyle(
                                      fontSize: 18,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Text(
                                  selectedPrescription!.userSymptoms,
                                  style: const pw.TextStyle(fontSize: 15),
                                ),
                                pw.SizedBox(
                                  height: 15,
                                ),
                                // pw. Icon(
                                //   Icons.medical_services_outlined,
                                //   size: 30,
                                // ),
                                pw.SizedBox(
                                  height: 10,
                                ),
                                pw.Text(
                                  selectedPrescription!.notes,
                                  style: const pw.TextStyle(fontSize: 16),
                                ),
                                pw.SizedBox(
                                  height: 20,
                                ),
                                pw.Row(
                                  children: [
                                    pw.SizedBox(
                                      width: 10,
                                    ),
                                    for (var i
                                        in List.generate(40, (index) => index))
                                      pw.Container(
                                        height: 1,
                                        width: 6,
                                        color: i % 2 == 0
                                            ? PdfColors.white
                                            : PdfColors.black,
                                      ),
                                    pw.SizedBox(
                                      width: 10,
                                    ),
                                    pw.Text(
                                      selectedPrescription!.pvalidtime,
                                      style: pw.TextStyle(
                                        fontSize: 15,
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),

                                pw.SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(
                              left: 5,
                              bottom: 5,
                            ),
                            child: pw.Text(
                              'This is an auto-generated Prescription and does not need Signature',
                              style: const pw.TextStyle(fontSize: 11),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.Divider(
                color: PdfColor.fromHex('#c0b871'),
                height: 40,
                endIndent: 15,
                indent: 15,
                thickness: 2,
              ),
            ],
          ); // Center
        }));

    // Page
  }
}
