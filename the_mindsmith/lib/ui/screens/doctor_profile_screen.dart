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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          // spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.network(
                      '$imgUrl/${widget.doctorModel.doctorImage}',
                      fit: BoxFit.fill,
                      height: 160,
                      width: 140,
                      errorBuilder: (context, object, stackTrace) {
                        return Image.asset(
                          'assets/images/doctor1.png',
                          fit: BoxFit.fill,
                          height: 160,
                          width: 140,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 140,
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
