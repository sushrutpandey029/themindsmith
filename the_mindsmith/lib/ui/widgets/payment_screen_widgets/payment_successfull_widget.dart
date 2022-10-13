import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/button_style.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/ui/screens/after_payment_successful_screen.dart';

class PaymentSuccessfulWidget extends StatelessWidget {
  const PaymentSuccessfulWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text('Payment received successfully',style: heading1,textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 70,
              child: Icon(Icons.done,size: 80,),
            ),
          ),
          Align(
             alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: ElevatedButton(
                style: smallBlackButtonStyle,
                onPressed: 
              (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AfterPaymentSuccessfulPage()));
              }, child: Text('Skip')),
            ),
          )
        ],
      ),
    );
  }
}