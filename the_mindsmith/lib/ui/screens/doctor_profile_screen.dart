import 'package:flutter/material.dart';

import '../../constants/text_style.dart';
import '../../constants/url_constant.dart';
import '../../models/doctor_model.dart';
import '../../util/custom_appbar.dart';

class DoctorProfilePgae extends StatefulWidget {
  const DoctorProfilePgae({
    Key? key,
    required this.doctorModel,
  }) : super(key: key);
  final DoctorModel doctorModel;

  @override
  State<DoctorProfilePgae> createState() => _DoctorProfilePgaeState();
}

class _DoctorProfilePgaeState extends State<DoctorProfilePgae> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, null),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    '$imgUrl/d=${widget.doctorModel.doctorImage}',
                    fit: BoxFit.fill,
                    height: 180,
                    width: 160,
                    errorBuilder: (context, object, stackTrace) {
                      return Image.asset(
                        'assets/images/doctor1.png',
                        fit: BoxFit.fill,
                        height: 120,
                        width: 100,
                      );
                    },
                  ),
                  SizedBox(
                    width: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctorModel.doctorName,
                          style: heading2,
                        ),
                        Text(widget.doctorModel.doctorSpecialty),
                        Text(widget.doctorModel.doctorQualification),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
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
        ),
      ),
    );
  }
}
