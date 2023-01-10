import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:the_mindsmith/models/book_slot_model.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/models/slot_model.dart';
import 'package:the_mindsmith/models/user_model.dart';
import 'package:the_mindsmith/providers/notification_provider.dart';
import 'package:the_mindsmith/services/repo/agora_toker_repo.dart';
import 'package:the_mindsmith/services/repo/book_slot_repo.dart';
import 'package:the_mindsmith/services/repo/fcm_repo.dart';
import 'package:the_mindsmith/util/shared_pref.dart';

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

  Future<void> bookSlot(BuildContext context, String fee) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    UserModel user =
        Provider.of<AuthProvider>(context, listen: false).userModel!;
    var doc =
        Provider.of<DoctorProvider>(context, listen: false).selectedDoctor!;

    String? videoToken = await _tokenRepo.generateToken(
        selectedSlot!.slotId, int.parse(user.id), context);

    BookSlotModel bookSlotModel = BookSlotModel(
        userId: user.id,
        userRegNo: user.userRegNo,
        userName: user.userName,
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
      user.id,
      user.userRegNo,
      user.userName,
      user.userPhone,
      user.userEmail,
      doc.doctorId,
      doc.doctorName,
      doc.doctorNumber,
      doc.doctorEmail,
      fee,
      "12345abcde",
    );
    Map<String, dynamic> slotMap = await _bookSlotRepo.bookSlot(bookSlotModel);
    await _bookSlotRepo.updateSlotStatus(bookSlotModel.slotId);
    String userToken = await SharedPref().getToken();
    if (slotMap["status"] == 1) {
      String docToken = slotMap["docpushtoken"];
      FCMRepo().sendNotification(userToken, docToken, context);
    }

    Provider.of<NotificationProvider>(context, listen: false)
        .fetchNotification(context);
    Provider.of<SlotProvider>(context, listen: false).selectedSlot = null;
    Navigator.pop(context);
    Navigator.pop(context);
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => const PaymentPage()));
  }

  Future<void> sendMail(BuildContext context) async {
    UserModel user =
        Provider.of<AuthProvider>(context, listen: false).userModel!;
    // DoctorModel doctor = Provider.of<DoctorProvider>(context, listen: false)
    //     .selectedDoctor!;
    // SlotModel slot = Provider.of<SlotProvider>(context, listen: false)
    //     .selectedSlot!;  ${doctor.doctorName} ${slot.scheduleDate} at ${slot.avgSlotTiming}
    //     .selectedSlot!;  ${doctor.doctorName} ${slot.scheduleDate} at ${slot.avgSlotTiming} ${user.userName}

    String userName = "";
    String password = "";

    String subject = "Appointment Confirmation";
    String body =
        "Dear ,\n\nYour appointment with Dr. has been confirmed on .\n\nRegards,\nTeam MindSmith";

    final smtpServer = gmail(userName, password);
    final message = Message()
      ..from = Address(userName, 'Team MindSmith')
      ..recipients.add("shivanuj13@gmail.com")
      ..subject = subject
      ..text = body;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}

class SlotDataSource extends CalendarDataSource {
  SlotDataSource(List<SlotModel> appointments) {
    List<SlotModel> slotList = appointments;
    slotList.removeWhere((element) =>
        DateTime.now().millisecondsSinceEpoch >
        DateTime.parse('${element.scheduleDate} ${element.startTime}')
            .millisecondsSinceEpoch);
    this.appointments = appointments;
  }
  SlotModel getSlot(int index) => appointments![index] as SlotModel;

  @override
  DateTime getStartTime(int index) {
    return DateTime.parse(
        '${getSlot(index).scheduleDate} ${getSlot(index).startTime}');
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.parse(
        '${getSlot(index).scheduleDate} ${getSlot(index).endTime}');
  }

  @override
  String getSubject(int index) {
    return getSlot(index).avgSlotTiming;
  }

  @override
  Color getColor(int index) {
    return getSlot(index).status == 'not book' ? Colors.green : Colors.red;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
