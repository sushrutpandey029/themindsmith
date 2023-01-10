import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/models/slot_model.dart';
import 'package:the_mindsmith/services/repo/doctor_repo.dart';
import 'package:the_mindsmith/services/repo/slot_repo.dart';
import 'package:the_mindsmith/ui/screens/doc_selction_in_chat.dart';
import 'package:the_mindsmith/util/error_dialogue.dart';

import '../ui/screens/consult_doctor_screen.dart';
import '../ui/screens/doctor_selection_screen.dart';
import 'slot_provider.dart';

class DoctorProvider extends ChangeNotifier {
  List<DoctorModel> doctorList = [];
  DoctorModel? selectedDoctor;
  final DoctorRepo _doctorRepo = DoctorRepo();
  final SlotRepo _slotRepo = SlotRepo();
  List<SlotModel> slotList = [];

  Future<void> fetchDoctor(BuildContext context, bool isChat) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));

    try {
      doctorList = await _doctorRepo.fetchDoctors();
      Navigator.pop(context);
      isChat
          ? Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DocSelectionChat()))
          : Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const DoctorSelectionPage()));
      print(doctorList);
    } on Exception catch (e) {
      Navigator.pop(context);
      errorDialogue(context: context, title: "error!!", message: e.toString());
    }
  }

  Future<void> selectDoctor(DoctorModel doctor, BuildContext context) async {
    Provider.of<SlotProvider>(context, listen: false).selectedSlot = null;
    selectedDoctor = doctor;
    await fetchSlotByDocId(context);
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ConsultDoctorPage()));
    notifyListeners();
  }

  Future<void> fetchSlotByDocId(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    String docId = selectedDoctor!.doctorId;

    List<SlotModel> list = await _slotRepo.fetchSlotByDocId(docId);
    list.removeWhere((element) =>
        DateTime.now().millisecondsSinceEpoch >
        DateTime.parse('${element.scheduleDate} ${element.startTime}')
            .millisecondsSinceEpoch);
    slotList = list;

    print(slotList);
    Navigator.pop(context);
  }
}
