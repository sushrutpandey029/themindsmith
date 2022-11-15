import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/doctor_model.dart';

class DoctorClinicWidget extends StatefulWidget {
  const DoctorClinicWidget({Key? key, required this.doctorModel})
      : super(key: key);
  final DoctorModel doctorModel;

  @override
  State<DoctorClinicWidget> createState() => _DoctorClinicWidgetState();
}

class _DoctorClinicWidgetState extends State<DoctorClinicWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.doctorModel.doctorClinicLocation,
            style: text2,
          ),
          const Text('Clinic Location'),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text(
            widget.doctorModel.doctorClinicNumber,
            style: text2,
          ),
          const Text('Clinic Phone Number'),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Text(
            widget.doctorModel.doctorEmail,
            style: text2,
          ),
          const Text('Email Address'),
        ],
      ),
    );
  }
}
