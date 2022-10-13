
//unused code


import 'package:doctor_app/ui/widgets/transaction_history_screen_widgets/transaction_history_tile_widget.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatefulWidget {
  TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
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
            Text('Transaction history'),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    body: Padding(padding: 
    EdgeInsets.all(18),
    child: Column(
      children: [
         SizedBox(height: 20,),
         TransactionHistoryTileWidget(amount: '1000', name: 'akjfkjf'),
         TransactionHistoryTileWidget(amount: '1000', name: 'akjfkjf'),
         TransactionHistoryTileWidget(amount: '1000', name: 'akjfkjf'),
         TransactionHistoryTileWidget(amount: '1000', name: 'akjfkjf'),
         TransactionHistoryTileWidget(amount: '1000', name: 'akjfkjf'),
         TransactionHistoryTileWidget(amount: '1000', name: 'akjfkjf'),
      ],
    ),
    ),
    );
  }
}