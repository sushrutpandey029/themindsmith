import 'dart:io';

import 'package:doctor_app/model/prescription_model.dart';
import 'package:doctor_app/model/user_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/repo/prescription_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../constants/text_style.dart';

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
      body: 'Dear Sir/Madam\nPlease find Your prescription attached with this mail.\nThanks & Regards\nTheMindSmith',
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
    _pdf!.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 28.0, horizontal: 18),
              child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text('Prescription',
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 18)),
                    pw.SizedBox(height: 50),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(),
                          borderRadius: pw.BorderRadius.circular(20)),
                      child: pw.Padding(
                        padding: const pw.EdgeInsets.all(18.0),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 5.0),
                              child: pw.Text(
                                "Patient's Name: ${selectedPrescription?.userName}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 5.0),
                              child: pw.Text(
                                "Registration NO: ${selectedPrescription?.userRegNo}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 5.0),
                              child: pw.Text(
                                "Age/Sex: ${selectedPrescription?.userAgeGender}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 5.0),
                              child: pw.Text(
                                "Symptoms: ${selectedPrescription?.userSymptoms}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 5.0),
                              child: pw.Text(
                                "Notes: ${selectedPrescription?.medicalHistory}",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 18.0),
                              child: pw.Align(
                                  alignment: pw.Alignment.bottomRight,
                                  child: pw.Text(
                                    selectedPrescription!.doctorName,
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])); // Center
        }));

    // Page
  }
}
