import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/input_decoration.dart';
import 'package:the_mindsmith/models/user_model.dart';
import 'package:the_mindsmith/ui/screens/fill_details_screen.dart';
import 'package:the_mindsmith/ui/screens/login_screen.dart';

import '../../providers/auth_provider.dart';
import '../../services/api/auth_api.dart';
import '../../services/repo/auth_repo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? _isChecked = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool? _serviceEnabled;
  LocationPermission? permission;
  Position? _locationData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48.0),
                        child: Material(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            'assets/images/mindsmith-logo.png',
                            width: 120,
                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                        controller: _email,
                        decoration:
                            inputDecoration1('Email', const Icon(Icons.person)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              value.length < 5 ||
                              value.length > 50) {
                            return 'User name required (Between 5 to 50)';
                          }
                          return null;
                        },
                        controller: _userName,
                        decoration: inputDecoration1(
                            'User Name', const Icon(Icons.verified)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Password required';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: _password,
                        decoration: inputDecoration1(
                            'Password', const Icon(Icons.lock)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Password required';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: _confirmPassword,
                        decoration: inputDecoration1(
                            'Confirm Password', const Icon(Icons.lock)),
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
                          const Text('keep me signed')
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        child: ElevatedButton(
                          style: fullButtonStyle,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await getcurrentlocation();
                              context.read<AuthProvider>().userModel = UserModel(
                                  userRegNo: '',
                                  userName: _userName.text,
                                  userEmail: _email.text,
                                  userPhone: "",
                                  userPassword: _password.text,
                                  userConfirmPassword: _confirmPassword.text,
                                  aadharName: '',
                                  aadharCardNo: '',
                                  gender: '',
                                  userAge: '',
                                  frontImageAadhar: '',
                                  backImageAadhar: '',
                                  panCardImage: '',
                                  userlocation:
                                      '${_locationData!.latitude},${_locationData!.longitude}');

                              print(context.read<AuthProvider>().userModel);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const FillDetailsPage()));
                            }
                          },
                          child: const Text('Create Account'),
                        ),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInPage()));
                      },
                      child: const Text(
                        'Login to App',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Need help?',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> getcurrentlocation() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled!) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _locationData = await Geolocator.getCurrentPosition();
  }
}
