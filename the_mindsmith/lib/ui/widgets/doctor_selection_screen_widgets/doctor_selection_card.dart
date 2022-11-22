import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/constants/url_constant.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/providers/chat_provider.dart';
import 'package:the_mindsmith/providers/doctor_provider.dart';

import '../../../constants/text_style.dart';

class DoctorSelectionCard extends StatefulWidget {
  const DoctorSelectionCard(
      {Key? key,
      required this.isChat,
      required this.doctorModel,
      required this.index})
      : super(key: key);
  final bool isChat;
  final DoctorModel doctorModel;

  final int index;

  @override
  State<DoctorSelectionCard> createState() => _DoctorSelectionCardState();
}

class _DoctorSelectionCardState extends State<DoctorSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: InkWell(
        onTap: () async {
          widget.isChat
              ? Provider.of<ChatProvider>(context, listen: false)
                  .selectDoctor(widget.doctorModel, context)
              : Provider.of<DoctorProvider>(context, listen: false)
                  .selectDoctor(widget.doctorModel, context);
          // await SlotRepo().fetchSlotByDocId(widget.doctorModel.doctorId);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 242, 233),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(blurRadius: 8, offset: Offset(3, 3))
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.network(
                    '$imgUrl/${widget.doctorModel.doctorImage}',
                    fit: BoxFit.fill,
                    height: 120,
                    width: 100,
                    errorBuilder: (context, object, stackTrace) {
                      return Image.asset(
                        'assets/images/doctor1.png',
                        fit: BoxFit.fill,
                        height: 120,
                        width: 100,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.doctorModel.doctorName,
                  style: text2,
                  // textAlign: TextAlign.left,
                ),
                Text(
                  widget.doctorModel.doctorQualification,
                  // textAlign: TextAlign.left,
                ),
                // Text(
                //   '\u{20B9} ${widget.doctorModel.doctorFee}',
                //   // textAlign: TextAlign.left,
                // ),
                Text(
                  widget.doctorModel.doctorStatus,
                  // textAlign: TextAlign.left,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
