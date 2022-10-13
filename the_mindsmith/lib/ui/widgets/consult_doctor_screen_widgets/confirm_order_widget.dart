import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/slot_model.dart';
import 'package:the_mindsmith/providers/slot_provider.dart';
import 'package:the_mindsmith/services/repo/payment_repo.dart';

import '../../../constants/button_style.dart';
import '../../../constants/text_style.dart';
import '../../../providers/doctor_provider.dart';
import '../../../util/date_time_helper.dart';

class ConfirmOrderWidget extends StatefulWidget {
  const ConfirmOrderWidget({Key? key}) : super(key: key);

  @override
  State<ConfirmOrderWidget> createState() => _ConfirmOrderWidgetState();
}

class _ConfirmOrderWidgetState extends State<ConfirmOrderWidget> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    // uploadPrescription();
    Provider.of<SlotProvider>(context, listen: false).bookSlot(context);
    print('payment done');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print('payment failed');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    SlotModel slotModel = Provider.of<SlotProvider>(context).selectedSlot!;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(blurRadius: 3, offset: const Offset(1, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Appointment Date',
                        style: text3,
                      ),
                      Text(
                        "${formateDate(slotModel.scheduleDate)} - ${formateTime(slotModel.startTime)}",
                        style: text3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(blurRadius: 3, offset: const Offset(1, 1))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Summary',
                  style: text2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Consulting fees',
                      style: text2,
                    ),
                    Text(
                      '\u{20B9} ${Provider.of<DoctorProvider>(context).selectedDoctor!.doctorFee}',
                      style: text2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        const Divider(
          thickness: 3,
          color: Colors.black,
        ),
        ElevatedButton(
            style: smallBlackButtonStyle1,
            onPressed: () {
              setState(() {
                var options = {
                  'key': "rzp_test_hvAG3FYmjUcENg",
                  'amount': (int.parse(Provider.of<DoctorProvider>(context,
                                  listen: false)
                              .selectedDoctor!
                              .doctorFee) *
                          100)
                      .toString(),
                  //in the smallest currency sub-unit.
                  'name': Provider.of<DoctorProvider>(context, listen: false)
                      .selectedDoctor!
                      .doctorName,
                  // 'order_id':
                  //     'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                  'description': "Demo",
                  'timeout': 300, // in seconds
                  'prefill': {
                    'contact':
                        Provider.of<DoctorProvider>(context, listen: false)
                            .selectedDoctor!
                            .doctorNumber,
                    'email': Provider.of<DoctorProvider>(context, listen: false)
                        .selectedDoctor!
                        .doctorEmail,
                  }
                };
                _razorpay.open(options);
                // Provider.of<SlotProvider>(context, listen: false)
                //     .bookSlot(context);
              });
            },
            child: const Text('Confirm Order'))
      ],
    );
  }
}
