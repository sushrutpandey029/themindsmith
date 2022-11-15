import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';
import 'package:the_mindsmith/ui/widgets/consult_doctor_screen_widgets/doctor_profile_widget.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../../constants/url_constant.dart';
import '../../providers/chat_provider.dart';
import '../widgets/consult_doctor_screen_widgets/slot_selection_widget.dart';

class ConsultDoctorPage extends StatefulWidget {
  const ConsultDoctorPage({Key? key}) : super(key: key);

  @override
  State<ConsultDoctorPage> createState() => _ConsultDoctorPageState();
}

class _ConsultDoctorPageState extends State<ConsultDoctorPage> {
  int _selectedIndex = 0;
  bool _isConsultWidget = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, null),
      body: Builder(builder: (context) {
        DoctorModel doctorModel =
            Provider.of<DoctorProvider>(context, listen: false).selectedDoctor!;
        return Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      '$imgUrl/d=${doctorModel.doctorImage}',
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
                            doctorModel.doctorName,
                            style: heading2,
                          ),
                          Text(doctorModel.doctorSpecialty),
                          Text(doctorModel.doctorQualification),
                        ],
                      ),
                    )
                  ],
                ),
                _isConsultWidget
                    ? const ConsultWidget()
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 18),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: fullButtonStyle,
                                  onPressed: () {
                                    setState(() {
                                      _isConsultWidget = true;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: const [
                                        Text(
                                          'Book an appointment',
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                        // const SizedBox(height: 10,),
                                        // Text('\u{20B9} ${doctorModel.doctorFee}'),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      style:
                                          smallButtonStyle(_selectedIndex == 0),
                                      onPressed: () {
                                        // setState(() {
                                        //   _selectedIndex = 0;
                                        // });
                                      },
                                      child: const Text('Book Follow Up')),
                                  ElevatedButton(
                                      style:
                                          smallButtonStyle(_selectedIndex == 1),
                                      onPressed: () {
                                        // setState(() {
                                        //   _selectedIndex = 1;
                                        // });
                                        Provider.of<ChatProvider>(context,
                                                listen: false)
                                            .selectDoctor(doctorModel, context);
                                      },
                                      child: const Text('Ask a Question')),
                                ]),
                          ),
                          // if (_selectedIndex == 0)
                          DoctorProfileWidget(
                            doctorModel: doctorModel,
                          )
                          // else
                          //   DoctorClinicWidget(
                          //     doctorModel: doctorModel,
                          //   )
                        ],
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
