//unused code

import 'package:doctor_app/constants/text_style.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'send_money_screen.dart';

class MyWalletPage extends StatefulWidget {
  MyWalletPage({Key? key}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ImageIcon(AssetImage('assets/icons/previous.png'))),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Image.asset(
                'assets/images/mindsmith-logo.png',
                width: 40,
              ),
            ),
            Text('My wallet'),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:48.0),
                child: Column(
                  children: [
                    Text('20,000',style: heading1,),
                    Text('Current balance'),
                    Text(context.read<AuthProvider>().doctorModel!.doctorName),
                    Text('Current balance'),
                  ],
                ),
              ),
              
              // SizedBox(height: 40,),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                      elevation: 2,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SendMoneyPage()));
                        },
                        shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                        title: Text('Send money'),
                        trailing: Icon(Icons.arrow_forward_ios)
                       ),
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Material(
                       shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                      elevation: 2,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                                   
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                        title: Text('Recieve money'),
                         trailing: Icon(Icons.arrow_forward_ios)
                       ,),
                  ),
                   ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}