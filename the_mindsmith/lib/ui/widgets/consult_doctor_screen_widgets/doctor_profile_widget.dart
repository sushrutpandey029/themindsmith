import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/doctor_model.dart';

class DoctorProfileWidget extends StatefulWidget {
  const DoctorProfileWidget({Key? key, required this.doctorModel})
      : super(key: key);
  final DoctorModel doctorModel;

  @override
  State<DoctorProfileWidget> createState() => _DoctorProfileWidgetState();
}

class _DoctorProfileWidgetState extends State<DoctorProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${widget.doctorModel.doctorExperience} Years of Expreince',
            style: text2,
          ),
          const Text('Medical Expreince'),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text(
            widget.doctorModel.doctorSpecialty,
            style: text2,
          ),
          const Text('Speciality'),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text(
            widget.doctorModel.doctorQualification,
            style: text2,
          ),
          const Text('Education'),
        ],
      ),
    );
  }
}
