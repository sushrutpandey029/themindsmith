import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';
import 'package:the_mindsmith/util/custom_appbar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar(context, 'My Orders'),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Card(
               margin: EdgeInsets.all(8),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
              child: GridTile(
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Item $index',style: text2,textAlign: TextAlign.center,),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Image.asset('assets/images/doctor1.png',),
                ), //just for testing, will fill with image later
              ),
            );
          },
        ),
      ),
    );
  }
}
