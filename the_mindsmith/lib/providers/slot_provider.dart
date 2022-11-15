import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/book_slot_model.dart';
import 'package:the_mindsmith/models/slot_model.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/services/repo/agora_toker_repo.dart';
import 'package:the_mindsmith/services/repo/book_slot_repo.dart';

import '../services/repo/payment_repo.dart';
import '../ui/screens/payment_screen.dart';
import 'auth_provider.dart';
import 'doctor_provider.dart';

class SlotProvider extends ChangeNotifier {
  SlotModel? selectedSlot;
  final BookSlotRepo _bookSlotRepo = BookSlotRepo();
  final AgoraTokenRepo _tokenRepo = AgoraTokenRepo();

  final PaymentRepo _paymentRepo = PaymentRepo();

  void selectSlot(SlotModel slotModel) {
    selectedSlot = slotModel;
    notifyListeners();
  }

  Future<void> bookSlot(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    var user = Provider.of<AuthProvider>(context, listen: false).userResponse;
    var doc =
        Provider.of<DoctorProvider>(context, listen: false).selectedDoctor!;

    String? videoToken = await _tokenRepo.generateToken(
        selectedSlot!.slotId, int.parse(user!['users']['id']!), context);

    BookSlotModel bookSlotModel = BookSlotModel(
        userId: user['users']['id'],
        userRegNo: user['users']['user_reg_no'],
        userName: user['users']['user_name'],
        slotId: selectedSlot!.slotId,
        doctorsId: selectedSlot!.doctorId,
        doctorsName: selectedSlot!.doctorsName,
        timeSlot: selectedSlot!.avgSlotTiming,
        startTime: selectedSlot!.startTime,
        endTime: selectedSlot!.endTime,
        appointmentDate: selectedSlot!.scheduleDate,
        videoToken: videoToken!);
    //todo:add payment
    //todo:add save data api
    await _paymentRepo.saveCustomerDoctorData(
      user['users']['id'],
      user['users']['user_reg_no'],
      user['users']['user_name'],
      user['users']['user_phone'],
      user['users']['user_email'],
      doc.doctorId,
      doc.doctorName,
      doc.doctorNumber,
      doc.doctorEmail,
      doc.doctorFee,
      "12345abcde",
    );
    await _bookSlotRepo.bookSlot(bookSlotModel);
    await _bookSlotRepo.updateSlotStatus(bookSlotModel.slotId);
    await Provider.of<NotificationProvider>(context, listen: false)
        .fetchNotification(context);
    Provider.of<SlotProvider>(context, listen: false).selectedSlot = null;
    Navigator.pop(context);
    Navigator.pop(context);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const PaymentPage()));
  }
}
