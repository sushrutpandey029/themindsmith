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
            buildSearch(),
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

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText:
            'Filter doctors by languages spoken, specialization and ratings',
        onChanged: searchBook,
      );
  void searchBook(String query) {
    final updateddoctorList = alldoctors.where((doctor) {
      final languageLower = doctor.languageSpoken.toLowerCase();
      final doctorspecialityLower = doctor.doctorSpecialty.toLowerCase();
      final doctorratingLower = doctor.rating.toLowerCase();
      final searchLower = query.toLowerCase();

      return languageLower.contains(searchLower) ||
          doctorspecialityLower.contains(searchLower) ||
          doctorratingLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      doctors = updateddoctorList;
    });
  }
}
