import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/input_decoration.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';

import 'ask_mobile_screen.dart';

class FillDetailsPage extends StatefulWidget {
  const FillDetailsPage({Key? key}) : super(key: key);

  @override
  State<FillDetailsPage> createState() => _FillDetailsPageState();
}

class _FillDetailsPageState extends State<FillDetailsPage> {
  // for male : 1 for female : 2
  int maleOrFemale = 0;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _aadharNo = TextEditingController();
  final TextEditingController _age = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/mindsmith-logo.png',
                width: 120,
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: _name,
                        decoration:
                            inputDecoration1('Name (as per Aadhar card)', null),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        maxLength: 12,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Required';
                          } else if (input.length < 12) {
                            return '12 Digit Aadhar No. is required';
                          }
                          return null;
                        },
                        controller: _aadharNo,
                        decoration: inputDecoration1('Aadhar card no', null),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        controller: _age,
                        decoration: inputDecoration1('Age', null),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        side: maleOrFemale == 1
                                            ? const BorderSide(width: 2)
                                            : BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white,
                                    fixedSize: Size.fromWidth(
                                        MediaQuery.of(context).size.width /
                                            2.4)),
                                onPressed: () {
                                  setState(() {
                                    maleOrFemale = 1;
                                  });
                                },
                                child: const Text('Male')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.grey,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        side: maleOrFemale == 2
                                            ? const BorderSide(width: 2)
                                            : BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fixedSize: Size.fromWidth(
                                        MediaQuery.of(context).size.width /
                                            2.4)),
                                onPressed: () {
                                  setState(() {
                                    maleOrFemale = 2;
                                  });
                                },
                                child: const Text('Female')),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(10)),
                      //         fixedSize: Size(MediaQuery.of(context).size.width, 60),
                      //         primary: Colors.white,
                      //         onPrimary: Colors.grey),
                      //     onPressed: () {},
                      //     child: Text(
                      //         'Click to upload front and back photo of Aadhar card')),
                      const SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: ElevatedButton(
                          style: fullButtonStyle,
                          onPressed: () async {
                            if (formKey.currentState!.validate() &&
                                maleOrFemale != 0) {
                              context
                                  .read<AuthProvider>()
                                  .authUserModel!
                                  .aadharName = _name.text;
                              context
                                  .read<AuthProvider>()
                                  .authUserModel!
                                  .aadharCardNo = _aadharNo.text;
                              context.read<AuthProvider>().authUserModel!.userAge =
                                  _age.text;
                              context.read<AuthProvider>().authUserModel!.gender =
                                  maleOrFemale == 1
                                      ? "male"
                                      : maleOrFemale == 2
                                          ? "female"
                                          : "others";

                              print(context.read<AuthProvider>().authUserModel!);
                              // await context.read<AuthProvider>().insertUser(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AskMobilePage()));
                            }
                            //
                          },
                          child: const Text('Continue'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: ElevatedButton(
                          style: fullButtonStyle,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Back'),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
