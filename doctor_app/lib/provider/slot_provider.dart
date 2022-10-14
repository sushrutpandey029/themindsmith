import 'package:doctor_app/model/slot_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/repo/slot_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../ui/screens/patient_details_screen.dart';

class SlotProvider extends ChangeNotifier {
  final SlotRepo _slotRepo = SlotRepo();
  List<SlotModel> slotList = [];
  SlotModel? selectedSlot;
  SlotModel? singleSlot;
  bool isLoading = false;
  bool isSingleLoading = false;
  List<UserModel> userList = [];
  List<String> userIdList = [];
  int unReadAppointment = 0;
  SlotModel? upcomingslot;

  void setnextappointementdatetime() {
    for (var element in slotList) {
      if (DateTime.parse("${element.appointmentDate} ${element.startedTime}")
              .difference(DateTime.now()) >
          Duration(minutes: int.parse(element.timeSlot.split(" ")[0]))) {
        upcomingslot = element;
        break;
      }
    }
    print("slotup $upcomingslot");
  }

  Future<void> fetchSlots(BuildContext context) async {
    unReadAppointment = 0;
    isLoading = true;
    notifyListeners();
    String doctorId =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    slotList = await _slotRepo.fetchSlots(doctorId);
    fetchUserList();
    for (var element in slotList) {
      if (element.readStatus != "read") {
        unReadAppointment++;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  void fetchUserList() {
    List<UserModel> list = [];
    List<String> idList = [];
    for (var element in slotList) {
      if (!idList.contains(element.userId)) {
        list.add(UserModel(
            userId: element.userId,
            userName: element.userName,
            userRegNo: element.userRegNo));
      }
    }
    userIdList = idList;
    userList = list;
  }

  Future<void> selectSlot(
    BuildContext context,
    int index,
  ) async {
    index == -1
        ? selectedSlot = singleSlot
        : selectedSlot = slotList.elementAt(index);

    if (selectedSlot!.readStatus != "read") {
      await _slotRepo.updateReadStatus(selectedSlot!.appointmentId);
      if (unReadAppointment > 0) {
        unReadAppointment--;
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => PatientDetailsPage())));
    notifyListeners();
  }

  Future<void> fetchSingleSlot(BuildContext context) async {
    isSingleLoading = true;
    notifyListeners();
    String doctorId =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    singleSlot = await _slotRepo.fetchSingleSlot(doctorId);

    isSingleLoading = false;
    notifyListeners();
  }
}
