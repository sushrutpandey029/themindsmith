import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';

import '../../constants/button_style.dart';
import '../../constants/input_decoration.dart';
import 'ask_details_screen.dart';
import 'id_verification_screen.dart';

class AskMobilePage extends StatefulWidget {
  const AskMobilePage({Key? key}) : super(key: key);

  @override
  State<AskMobilePage> createState() => _AskMobilePageState();
}

class _AskMobilePageState extends State<AskMobilePage> {
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<AuthProvider>(
          builder: (context, value, widget) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('The MindSmith', style: heading1),
              Image.asset(
                'assets/images/brain.png',
                width: 60,
              ),
              Image.asset(
                'assets/images/hospital-bed.png',
                width: 140,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to healthy life',
                    style: heading1,
                  ),
                  Text(
                      'certified doctors, home delivery of medicines, NABL accerdited labs and more',textAlign: TextAlign.center,),
                ],
              ),
              value.isOtpSent
                  ? TextField(
                      controller: otp,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration1('OTP', null),
                    )
                  : TextField(
                    maxLength: 10,
                      controller: phone,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration1('Mobile Number', null),
                    ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                  style: fullButtonStyle,
                  onPressed: () {
                  // value.userModel?.userPhone = phone.text;
          //            Navigator.of(context)
          // .push(MaterialPageRoute(builder: (context) => IdVerificationPage()));
                    value.isOtpSent
                        ? value.verifyOtp(otp.text, context)
                        : value.verifyPhoneNumber(phone.text, context);
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AskDetailsPage()));
                  },
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
