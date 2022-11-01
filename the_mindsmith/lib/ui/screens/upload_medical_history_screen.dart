import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/input_decoration.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/prescription_provider.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class UploadMedicalHistoryPage extends StatefulWidget {
  const UploadMedicalHistoryPage({Key? key}) : super(key: key);

  @override
  State<UploadMedicalHistoryPage> createState() =>
      _UploadMedicalHistoryPageState();
}

class _UploadMedicalHistoryPageState extends State<UploadMedicalHistoryPage> {
  final TextEditingController _remarks = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Upload Medical History'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Consumer<PrescriptionProvider>(
            builder: (context, value, widget) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 60,
                    child: ElevatedButton(
                        style: fullButtonStyleWhite,
                        onPressed: () {
                          value.selectFile();
                        },
                        child: Text(
                            value.fileName ?? 'Upload Previous prescription')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '(In pdf form)',
                      style: text3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        const BoxShadow(
                            offset: Offset(2, 2),
                            color: Colors.black26,
                            blurRadius: 6),
                        BoxShadow(
                            offset: const Offset(-10, -10),
                            color: Colors.white.withOpacity(0.85),
                            blurRadius: 20)
                      ]),
                      child: TextField(
                        controller: _remarks,
                        decoration: inputDecoration2(
                            'Remarks', const Icon(Icons.feedback)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 60,
                      child: ElevatedButton(
                          style: fullButtonStyleWhite,
                          onPressed: () {
                            value.uploadPrescription(context, _remarks.text);
                          },
                          child: const Text('Submit')),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
