//unused code

import 'package:doctor_app/ui/widgets/withdraw_history_screen_widgets/withdraw_history_tile_widget.dart';
import 'package:flutter/material.dart';

class WithdrawHistoryPage extends StatefulWidget {
  const WithdrawHistoryPage({Key? key}) : super(key: key);

  @override
  State<WithdrawHistoryPage> createState() => _WithdrawHistoryPageState();
}

class _WithdrawHistoryPageState extends State<WithdrawHistoryPage> {
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
              child: const ImageIcon(AssetImage('assets/icons/previous.png'))),
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
            const Text('Withdraw history'),
          ],
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            WithdrawHistoryTileWidget(
              days: '1',
              amount: '500',
            ),
            WithdrawHistoryTileWidget(
              days: '1',
              amount: '100',
            ),
            WithdrawHistoryTileWidget(
              days: '2',
              amount: '800',
            ),
            WithdrawHistoryTileWidget(
              days: '2',
              amount: '200',
            ),
            WithdrawHistoryTileWidget(
              days: '3',
              amount: '100',
            ),
            WithdrawHistoryTileWidget(
              days: '4',
              amount: '300',
            ),
          ],
        ),
      ),
    );
  }
}
