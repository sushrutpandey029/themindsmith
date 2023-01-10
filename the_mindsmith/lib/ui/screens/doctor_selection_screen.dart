import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/ui/widgets/doctor_selection_screen_widgets/doctor_selection_card.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../widgets/common/search_widget.dart';

class DoctorSelectionPage extends StatefulWidget {
  const DoctorSelectionPage({Key? key}) : super(key: key);

  @override
  State<DoctorSelectionPage> createState() => _DoctorSelectionPageState();
}

class _DoctorSelectionPageState extends State<DoctorSelectionPage> {
  String query = '';
  late List<DoctorModel> doctors;
  late List<DoctorModel> alldoctors;

  @override
  void didChangeDependencies() {
    alldoctors = Provider.of<DoctorProvider>(context).doctorList;
    doctors = alldoctors;
    doctors.sort((a, b) => a.doctorName.compareTo(b.doctorName));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Our Experts'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: SearchWidget(
                      text: query,
                      hintText: 'Search doctors by name',
                      onChanged: searchDoc,
                    ),
                  ),
                  PopupMenuButton<int>(
                      icon: const Icon(Icons.sort),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Filter by language',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .languageSpoken
                                                  .toLowerCase()
                                                  .contains('english'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('English'),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .languageSpoken
                                                  .toLowerCase()
                                                  .contains('hindi'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('Hindi'),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .languageSpoken
                                                  .toLowerCase()
                                                  .contains('punjabi'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('Punjabi'),
                                      )),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Filter by speciality',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .doctorSpecialty
                                                  .toLowerCase()
                                                  .contains('anxiety'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('Anxiety'),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .doctorSpecialty
                                                  .toLowerCase()
                                                  .contains('depression'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text('Depression'),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .doctorSpecialty
                                                  .toLowerCase()
                                                  .contains(
                                                      'substance use disorder'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text(
                                            'Substance use disorder'),
                                      )),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          doctors = alldoctors
                                              .where((doctor) => doctor
                                                  .doctorSpecialty
                                                  .toLowerCase()
                                                  .contains(
                                                      'genetic and molecular psychiatry'))
                                              .toList();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text(
                                            'Genetic and molecular psychiatry'),
                                      )),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Filter by rating',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              doctors = alldoctors
                                                  .where((doctor) =>
                                                      doctor.rating == '5')
                                                  .toList();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Text('5'),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              doctors = alldoctors
                                                  .where((doctor) =>
                                                      doctor.rating == '4')
                                                  .toList();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Text('4'),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              doctors = alldoctors
                                                  .where((doctor) =>
                                                      doctor.rating == '3')
                                                  .toList();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Text('3'),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              doctors = alldoctors
                                                  .where((doctor) =>
                                                      doctor.rating == '2')
                                                  .toList();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Text('2'),
                                          )),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              doctors = alldoctors
                                                  .where((doctor) =>
                                                      doctor.rating == '1')
                                                  .toList();
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Text('1'),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // PopupMenuItem(
                            //   child: Column(
                            //     children: [
                            //       Column(
                            //         children: [
                            //           Text('Filter by Exprince'),
                            //           const SizedBox(height: 10),
                            //           Row(
                            //             children: [

                            //             ]
                            //           )
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ])
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return DoctorSelectionCard(
                    isChat: false, doctorModel: doctors[index], index: index);
              },
              itemCount: doctors.length,
            )),
          ],
        ),
      ),
    );
  }

  void searchDoc(String query) {
    var updateddoctorList = alldoctors.where((doctor) {
      // var languageLower = doctor.languageSpoken.toLowerCase();
      // var doctorspecialityLower = doctor.doctorSpecialty.toLowerCase();
      // var doctorratingLower = doctor.rating.toLowerCase();
      var doctorName = doctor.doctorName.toLowerCase();
      var searchLower = query.toLowerCase();

      return doctorName.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      doctors = updateddoctorList;
    });
  }
}
