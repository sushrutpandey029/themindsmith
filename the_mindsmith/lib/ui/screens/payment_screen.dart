import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/ui/widgets/payment_screen_widgets/online_payment_options_widget.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

import '../../constants/button_style.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({ Key? key }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool _isPaymentSelectionWidget=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context, 'Payment'),
      body:  _isPaymentSelectionWidget?OnlinePaymentWidget(): Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select/ Enter Coupon Code',style: heading3,),TextField(decoration: InputDecoration(
              hintText: 'Enter your coupon code'
            ),),
            Container(
          margin: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(blurRadius: 3, offset: Offset(1, 1))]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                  child: Text('Total Payable',style: text2,)
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text('\u{20B9} ',style: text2,)
                ),

                
              ],
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(blurRadius: 3, offset: Offset(1, 1))]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment Method',style: text2,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:12.0),
                  child: Divider(thickness: 3,),
                ),Text('Pay Online'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:12.0),
                  child: Divider(thickness: 3,),
                ),
              ],
            )
          ),
        ),

         SizedBox(
          height: 200,
        ),
        Divider(
          thickness: 3,
        ),
        Center(
          child: ElevatedButton(
              style: smallBlackButtonStyle1,
              onPressed: () {
                setState(() {
                  _isPaymentSelectionWidget = true;
                });
              },
              child: Text('Confirm Order')),
        )
          ],
        ),
      ),
    );
  }
}