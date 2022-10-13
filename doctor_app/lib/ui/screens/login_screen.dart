import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/ui/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_style.dart';
import '../../constants/input_decoration.dart';


class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(
              flex: 3,
            ),
             Material(
              elevation:20,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              child: Image.asset('assets/images/mindsmith-logo.png',width: 120,)),
            Spacer(
              flex: 3,
            ),
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: inputDecoration1('Email', Icon(Icons.person)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _password,
                  decoration: inputDecoration1('Password', Icon(Icons.lock)),
                ),
              
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  child: ElevatedButton(
                    style: fullButtonStyle,
                    onPressed: () {
                      Provider.of<AuthProvider>(context,listen: false).loginWithEmail(_email.text, _password.text, context);
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Wrapper())));
                    },
                    child: Text('Get to App'),
                  ),
                ),
                
              ],
            )),
            
            TextButton(
                onPressed: () {},
                child: Text(
                  'Need help?',
                  style: TextStyle(color: Colors.black),
                )),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      )),
    );
  }
}
