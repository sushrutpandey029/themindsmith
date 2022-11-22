import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/model/prescription_model.dart';
import 'package:doctor_app/provider/prescription_provider.dart';
import 'package:doctor_app/ui/screens/download_prescription_screen.dart';
import 'package:doctor_app/ui/screens/prescription_listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../widgets/comman/app_bar.dart';

class NewPrescriptionPage extends StatefulWidget {
  const NewPrescriptionPage({Key? key}) : super(key: key);

  @override
  State<NewPrescriptionPage> createState() => _NewPrescriptionPageState();
}

class _NewPrescriptionPageState extends State<NewPrescriptionPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _pvalidtimeController = TextEditingController();
  final List<bool> _values = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  final List<String> symptoms = [
    'Sleep or appetite changes — Dramatic sleep and appetite changes or decline in personal care.',
    'Mood changes — Rapid or dramatic shifts in emotions or depressed feelings, greater irritability.',
    'Withdrawal — Recent social withdrawal and loss of interest in activities previously enjoyed.',
    'Drop in functioning — An unusual drop in functioning, at school, work or social activities, such as quitting sports, failing in school or difficulty performing familiar tasks.',
    'Problems thinking — Problems with concentration, memory or logical thought and speech that are hard to explain.',
    'Increased sensitivity — Heightened sensitivity to sights, sounds, smells or touch; avoidance of over-stimulating situations.',
    'Apathy — Loss of initiative or desire to participate in any activity.',
    'Feeling disconnected — A vague feeling of being disconnected from oneself or one’s surroundings; a sense of unreality.',
    'Illogical thinking — Unusual or exaggerated beliefs about personal powers to understand meanings or influence events; illogical or “magical” thinking typical of childhood in an adult.',
    'Nervousness — Fear or suspiciousness of others or a strong nervous feeling.',
    'Unusual behavior — Odd, uncharacteristic, peculiar behavior.',
    'Changes in school or work — Increased absenteeism, worsening performance, difficulties in relationships with peers and co-workers.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        "Generate New Prescription",
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(child:
              Consumer<PrescriptionProvider>(builder: (context, value, widget) {
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
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Padding(
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
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Padding(
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
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        labelText: 'Age/Sex (eg: 35/F)',
                        border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _notesController,
                    maxLines: null,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        labelText: 'Notes',
                        border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _pvalidtimeController,
                    maxLines: null,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        labelText: 'Prescription validity(in days)',
                        border: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            gapPadding: 2,
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          'Symptoms',
                          style: heading3,
                        ),
                      ),
                      CheckboxListTile(
                        title: const Text('Sleep or appetite changes'),
                        subtitle: const Text(
                            'Dramatic sleep and appetite changes or decline in personal care.'),
                        value: _values[0],
                        onChanged: (value) {
                          setState(() {
                            _values[0] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Mood changes'),
                        subtitle: const Text(
                            'Rapid or dramatic shifts in emotions or depressed feelings, greater irritability.'),
                        value: _values[1],
                        onChanged: (value) {
                          setState(() {
                            _values[1] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Withdrawal'),
                        subtitle: const Text(
                            'Recent social withdrawal and loss of interest in activities previously enjoyed.'),
                        value: _values[2],
                        onChanged: (value) {
                          setState(() {
                            _values[2] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Drop in functioning'),
                        subtitle: const Text(
                            'An unusual drop in functioning, at school, work or social activities, such as quitting sports, failing in school or difficulty performing familiar tasks'),
                        value: _values[3],
                        onChanged: (value) {
                          setState(() {
                            _values[3] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Problems thinking'),
                        subtitle: const Text(
                            'Problems with concentration, memory or logical thought and speech that are hard to explain.'),
                        value: _values[4],
                        onChanged: (value) {
                          setState(() {
                            _values[4] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Increased sensitivity'),
                        subtitle: const Text(
                            'Heightened sensitivity to sights, sounds, smells or touch; avoidance of over-stimulating situations.'),
                        value: _values[5],
                        onChanged: (value) {
                          setState(() {
                            _values[5] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Apathy'),
                        subtitle: const Text(
                            'Loss of initiative or desire to participate in any activity.'),
                        value: _values[6],
                        onChanged: (value) {
                          setState(() {
                            _values[6] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Feeling disconnected'),
                        subtitle: const Text(
                            'A vague feeling of being disconnected from oneself or one’s surroundings; a sense of unreality.'),
                        value: _values[7],
                        onChanged: (value) {
                          setState(() {
                            _values[7] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Illogical thinking'),
                        subtitle: const Text(
                            'Unusual or exaggerated beliefs about personal powers to understand meanings or influence events; illogical or “magical” thinking typical of childhood in an adult.'),
                        value: _values[8],
                        onChanged: (value) {
                          setState(() {
                            _values[8] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Nervousness'),
                        subtitle: const Text(
                            'Fear or suspiciousness of others or a strong nervous feeling.'),
                        value: _values[9],
                        onChanged: (value) {
                          setState(() {
                            _values[9] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Unusual behavior'),
                        subtitle: const Text(
                            'Odd, uncharacteristic, peculiar behavior.'),
                        value: _values[10],
                        onChanged: (value) {
                          setState(() {
                            _values[10] = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Changes in school or work'),
                        subtitle: const Text(
                            'Increased absenteeism, worsening performance, difficulties in relationships with peers and co-workers.'),
                        value: _values[11],
                        onChanged: (value) {
                          setState(() {
                            _values[11] = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ElevatedButton(
                      style: smallBlackButtonStyle1,
                      onPressed: () async {
                        List<int> tempindex = [];
                        String usersymptoms = '';
                        for (var i = 0; i < _values.length; i++) {
                          if (_values[i] == true) {
                            tempindex.add(i);
                          }
                        }
                        for (final i in tempindex) {
                          usersymptoms += '${symptoms[i]}\n';
                        }

                        await value.addPrescription(
                            context,
                            PrescriptionModel(
                              doctorId: context
                                  .read<AuthProvider>()
                                  .doctorModel!
                                  .doctorId,
                              doctorName: context
                                  .read<AuthProvider>()
                                  .doctorModel!
                                  .doctorName,
                              doctorQualification: context
                                  .read<AuthProvider>()
                                  .doctorModel!
                                  .doctorQualification,
                              userId: value.selectedUser!.userId,
                              userRegNo: value.selectedUser!.userRegNo,
                              userName: value.selectedUser!.userName,
                              userFullName: value.selectedUser!.userName,
                              userEmail: _emailController.text,
                              userAgeGender: _ageController.text,
                              userSymptoms: usersymptoms,
                              notes: _notesController.text,
                              pvalidtime: _pvalidtimeController.text,
                            ));
                        context
                            .read<PrescriptionProvider>()
                            .fetchPrescription(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PrescriptionListingPage(
                                      isHistoryPage: false,
                                    )));
                      },
                      child: const Text('Create Prescription')),
                ))
              ],
            );
          })),
        ),
      ),
    );
  }
}
