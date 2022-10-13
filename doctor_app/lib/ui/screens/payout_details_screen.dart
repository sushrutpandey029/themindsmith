import 'package:doctor_app/constants/button_style.dart';
import 'package:doctor_app/constants/input_decoration.dart';
import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/repo/submit_pay_request_repo.dart';
import 'package:doctor_app/ui/widgets/comman/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/doctor_model.dart';
import '../../provider/auth_provider.dart';

class PayOutDetailsPage extends StatefulWidget {
  PayOutDetailsPage({Key? key}) : super(key: key);

  @override
  State<PayOutDetailsPage> createState() => _PayOutDetailsPageState();
}

class _PayOutDetailsPageState extends State<PayOutDetailsPage> {
  TextEditingController accNumberController = TextEditingController();
  TextEditingController IFSCController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController beneficiaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PayoutRepo _payoutRepo = PayoutRepo();
    DoctorModel doctorModel =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(context, 'Payout Details'),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 30,
            ),
            Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: inputDecoration1('Account Number', null),
                controller: accNumberController,
              ),
            ),
            Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: inputDecoration1('IFSC', null),
                controller: IFSCController,
              ),
            ),
            Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: inputDecoration1('Branch Name', null),
                controller: branchNameController,
              ),
            ),
            Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                decoration: inputDecoration1('Beneficiary Name', null),
                controller: beneficiaryController,
              ),
            ),
            SizedBox(
              width: 200,
              height: 60,
              child: ElevatedButton(
                  style: fullButtonStyle,
                  onPressed: () {
                    _payoutRepo.payRequest(
                      doctorModel.doctorId,
                      doctorModel.doctorName,
                      doctorModel.doctorNumber,
                      doctorModel.doctorEmail,
                      doctorModel.doctorFee,
                      accNumberController.text,
                      IFSCController.text,
                      branchNameController.text,
                      beneficiaryController.text,
                    );
                  },
                  child: Text('Submit', style: text4)),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
