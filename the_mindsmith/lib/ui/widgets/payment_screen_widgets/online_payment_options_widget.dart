import 'package:flutter/material.dart';
import 'package:the_mindsmith/ui/widgets/payment_screen_widgets/payment_successfull_widget.dart';

import '../../../constants/button_style.dart';
import '../../../constants/text_style.dart';

class OnlinePaymentWidget extends StatefulWidget {
  const OnlinePaymentWidget({Key? key}) : super(key: key);

  @override
  State<OnlinePaymentWidget> createState() => _OnlinePaymentWidgetState();
}

class _OnlinePaymentWidgetState extends State<OnlinePaymentWidget> {
  bool _isSuccessfull = false;
  @override
  Widget build(BuildContext context) {
    return _isSuccessfull?PaymentSuccessfulWidget(): Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
        Row(

          children: [
            CircleAvatar(backgroundColor: Colors.black, child: Icon(Icons.phone)),
            Padding(
              padding: const EdgeInsets.only(left:12.0),
              child: Text('+91 95666664754',style: text2,),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:18.0),
          child: Text('CARDS, UPI & MORE',style: heading3,),
          
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card',style: text2,),
              Text('Visa, Master card, Rupay'),
               Divider(
            thickness: 3,
          ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('UPI',style: text2,),
              Text('Google Pay, Phone & More'),
               Divider(
            thickness: 3,
          ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Netbanking',style: text2,),
              Text('All Indian Banks'),
               Divider(
            thickness: 3,
          ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wallet',style: text2,),
              Text('Google Pay, Phone & More'),
               Divider(
            thickness: 3,
          ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('EMI',style: text2,),
              Text('EMI via Credit & Debit card'),
               Divider(
            thickness: 3,
          ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Divider(
          thickness: 3,
        ),
        Center(
          child: ElevatedButton(
              style: smallBlackButtonStyle1,
              onPressed: () {
                setState(() {
                  _isSuccessfull = true;
                });
              },
              child: Text('Confirm Order')),
        )
      ]),
    );
  }
}
