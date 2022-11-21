import 'package:doctor_app/model/doctor_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/provider/patient_history_provider.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/widgets/patient_history_screen_widgets/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_style.dart';
import '../../model/patient_history_model.dart';
import '../widgets/comman/app_bar.dart';

class PatientHistoryPage extends StatefulWidget {
  const PatientHistoryPage({Key? key}) : super(key: key);

  @override
  State<PatientHistoryPage> createState() => _PatientHistoryPageState();
}

class _PatientHistoryPageState extends State<PatientHistoryPage> {
  final TextEditingController _city = TextEditingController();
  final TextEditingController _treatmentStartDate = TextEditingController();
  final TextEditingController _diagnosis = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Patient History",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Consumer<PatientHistoryProvider>(
              builder: (context, value, widget) {
            return Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomBox(
                    title: 'Patient Name',
                    value: value.user!.userName,
                    width: MediaQuery.of(context).size.width),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomBox(
                    title: 'Patient Registration No.',
                    value: value.user!.userRegNo,
                    width: MediaQuery.of(context).size.width),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomBox(
                    title: 'Age/Sex',
                    value: context
                        .watch<PrescriptionProvider>()
                        .selectedPrescription!
                        .userAgeGender,
                    width: MediaQuery.of(context).size.width),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomBox(
                    title: 'Symptoms',
                    value: context
                        .watch<PrescriptionProvider>()
                        .selectedPrescription!
                        .userSymptoms,
                    width: MediaQuery.of(context).size.width),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomBox(
                    title: 'Notes',
                    value: context
                        .watch<PrescriptionProvider>()
                        .selectedPrescription!
                        .notes,
                    width: MediaQuery.of(context).size.width),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
                child: TextFormField(
                  controller: _city,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'City',
                      border: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0))),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0)))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
                child: TextFormField(
                  controller: _treatmentStartDate,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Treatment Start Date',
                      border: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0))),
                      enabledBorder: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0))),
                      focusedBorder: OutlineInputBorder(
                          gapPadding: 2,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0)))),
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
              //   child: TextFormField(
              //     controller: _diagnosis,
              //     decoration: InputDecoration(
              //         filled: true,
              //         labelText: 'Diagnosis',
              //         border: OutlineInputBorder(
              //             gapPadding: 2,
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide:
              //                 BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
              //         enabledBorder: OutlineInputBorder(
              //             gapPadding: 2,
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide:
              //                 BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
              //         focusedBorder: OutlineInputBorder(
              //             gapPadding: 2,
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide:
              //                 BorderSide(color: Color.fromARGB(255, 0, 0, 0)))),
              //   ),
              // ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width / 4,
              //         child: TextFormField(
              //           controller: _age,
              //           decoration: InputDecoration(
              //               filled: true,
              //               labelText: 'Age',
              //               border: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0))),
              //               enabledBorder: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0))),
              //               focusedBorder: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0)))),
              //         ),
              //       ),
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width / 4,
              //         child: TextFormField(
              //           controller: _gender,
              //           decoration: InputDecoration(
              //               filled: true,
              //               labelText: 'Gender',
              //               border: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0))),
              //               enabledBorder: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0))),
              //               focusedBorder: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0)))),
              //         ),
              //       ),
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width / 4,
              //         child: TextFormField(
              //           controller: _weight,
              //           decoration: InputDecoration(
              //               filled: true,
              //               labelText: 'Weight',
              //               border: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0))),
              //               enabledBorder: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0))),
              //               focusedBorder: OutlineInputBorder(
              //                   gapPadding: 2,
              //                   borderRadius: BorderRadius.circular(10),
              //                   borderSide: BorderSide(
              //                       color: Color.fromARGB(255, 0, 0, 0)))),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 18, vertical: 8.0),
              //   child: TextFormField(
              //     controller: _notes,
              //     decoration: InputDecoration(
              //         filled: true,
              //         labelText: 'Notes',
              //         border: OutlineInputBorder(
              //             gapPadding: 2,
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide:
              //                 BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
              //         enabledBorder: OutlineInputBorder(
              //             gapPadding: 2,
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide:
              //                 BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
              //         focusedBorder: OutlineInputBorder(
              //             gapPadding: 2,
              //             borderRadius: BorderRadius.circular(10),
              //             borderSide:
              //                 BorderSide(color: Color.fromARGB(255, 0, 0, 0)))),
              //   ),
              // ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                    style: smallBlackButtonStyle1,
                    onPressed: () async {
                      DoctorModel doctor =
                          context.read<AuthProvider>().doctorModel!;
                      await value.addHistory(
                          context,
                          PatientHistoryModel(
                              doctorId: doctor.doctorId,
                              doctorName: doctor.doctorName,
                              userId: value.user!.userId,
                              userName: value.user!.userName,
                              userRegNo: value.user!.userRegNo,
                              patientName: value.user!.userName,
                              treatmentStartDate: _treatmentStartDate.text,
                              diagnosis: _diagnosis.text,
                              city: _city.text,
                              age: _age.text,
                              gender: _gender.text,
                              note: _notes.text));
                    },
                    child: const Text('Add To Patient History')),
              ))
            ]);
          }),
        ),
      ),
    );
  }
}
