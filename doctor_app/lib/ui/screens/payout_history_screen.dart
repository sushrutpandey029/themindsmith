import 'package:doctor_app/ui/widgets/payout_history_screen_widgets/payout_history_tile_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/comman/app_bar.dart';

class PayOutHistoryPage extends StatefulWidget {
  PayOutHistoryPage({Key? key}) : super(key: key);

  @override
  State<PayOutHistoryPage> createState() => _PayOutHistoryPageState();
}

class _PayOutHistoryPageState extends State<PayOutHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,"Payout History",),
      body: Padding(padding: EdgeInsets.all(18),
      child: Column(
        children: [
           SizedBox(height: 20,),
           PayoutHistoryTileWidget(name: 'Rakesh sharma', amount: '1000', bankName: 'HDFC'),
           PayoutHistoryTileWidget(name: 'Rakesh sharma', amount: '1000', bankName: 'HDFC'),
           PayoutHistoryTileWidget(name: 'Rakesh sharma', amount: '1000', bankName: 'HDFC'),
           PayoutHistoryTileWidget(name: 'Rakesh sharma', amount: '1000', bankName: 'HDFC'),
           PayoutHistoryTileWidget(name: 'Rakesh sharma', amount: '1000', bankName: 'HDFC'),
        ],
      ),
      ),
    );
  }
}