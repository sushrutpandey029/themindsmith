import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/input_decoration.dart';
import 'package:the_mindsmith/ui/screens/help_screen.dart';

import '../../providers/auth_provider.dart';

import 'signup_screen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool? _isChecked = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 3,
            ),
            Material(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: Image.asset(
                  'assets/images/mindsmith-logo.png',
                  width: 120,
                )),
            const Spacer(
              flex: 3,
            ),
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration:
                      inputDecoration1('Email', const Icon(Icons.person)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration:
                      inputDecoration1('Password', const Icon(Icons.lock)),
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value;
                          });
                        }),
                    const Text('Remember Me')
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: ElevatedButton(
                    style: fullButtonStyle,
                    onPressed: () async {
                      // await authApi.insertUser(UserModel(userName: 'userName', userEmail: 'userEmail', userPhone: 'userPhone', userPassword: 'userPassword', userConfirmPassword: 'userConfirmPassword', aadharName: 'aadharName', aadharCardNo: 'aadharCardNo', gender: 'gender', userAge: 'userAge', frontImageAadhar: File(image!.path), backImageAadhar: File(image.path), penCardImage: File(image.path)));

                      Provider.of<AuthProvider>(context, listen: false)
                          .loginWithEmail(_email.text, _password.text, context);

                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Wrapper())));
                    },
                    child: const Text('Get Started'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 10,
                        shape: const CircleBorder(),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 40,
                            onPressed: () {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .signInWithGoogle(context);
                            },
                            icon: Image.asset(
                              'assets/icons/icons8-google-96.png',
                            )),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 10,
                        shape: const CircleBorder(),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 40,
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/icons/icons8-facebook-96.png',
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Create account',
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'FAQs',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      )),
    );
  }
}
