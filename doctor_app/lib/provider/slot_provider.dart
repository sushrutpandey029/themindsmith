import 'package:doctor_app/model/add_slot_model.dart';
import 'package:doctor_app/model/appointment_model.dart';
import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/repo/slot_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../model/slot_model.dart';
import '../model/user_model.dart';
import '../ui/screens/patient_details_screen.dart';

class SlotProvider extends ChangeNotifier {
  final SlotRepo _slotRepo = SlotRepo();
  List<AppointmentModel> appointmentList = [];
  AppointmentModel? selectedAppointment;
  AppointmentModel? singleAppointment;
  bool isLoading = false;
  bool isSingleLoading = false;
  List<UserModel> userList = [];
  List<String> userIdList = [];
  int unReadAppointment = 0;
  AppointmentModel? upcomingAppointment;
  List<SlotModel> slotList = [];

  void setNextAppointmentDateTime() {
    for (var element in appointmentList) {
      if (DateTime.parse("${element.appointmentDate} ${element.endTime}")
              .difference(DateTime.now()) >
          Duration(minutes: 5)) {
        upcomingAppointment = element;

        break;
      }
    }
  }

  Future<void> addSlot(AddSlotModel addSlotModel, BuildContext context) async {
    await _slotRepo.addSlot(addSlotModel);
    fetchSlots(context);
  }

  Future<void> fetchSlots(BuildContext context) async {
    slotList = await _slotRepo
        .fetchSlots(context.read<AuthProvider>().doctorModel!.doctorId);
    notifyListeners();
  }

  Future<void> updateSlot(SlotModel slotModel, BuildContext context) async {
    await _slotRepo.updateSlot(slotModel);
    fetchSlots(context);
  }

  Future<void> deleteSlot(String slotId, BuildContext context) async {
    await _slotRepo.deleteSlot(slotId);

    fetchSlots(context);
  }

  Future<void> fetchAppointment(BuildContext context) async {
    // isLoading = true;
    // notifyListeners();
    String doctorId =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    print(doctorId);
    appointmentList = await _slotRepo
        .fetchAppointment(doctorId)
        .then((value) => value.reversed.toList());
    fetchUserList();
    unReadAppointment = 0;
    for (var element in appointmentList) {
      if (element.readStatus != "read") {
        unReadAppointment++;
      }
    }
    isLoading = false;
    setNextAppointmentDateTime();
    notifyListeners();
  }

  void fetchUserList() {
    List<UserModel> list = [];
    List<String> idList = [];

    for (var element in appointmentList.reversed) {
      if (!idList.contains(element.userId)) {
        idList.add(element.userId);
        list.add(UserModel(
            dateTime: DateTime.parse(
                "${element.appointmentDate} ${element.startedTime}"),
            userId: element.userId,
            userName: element.userName,
            userRegNo: element.userRegNo));
      }
    }
    userIdList = idList;
    userList = list;
  }

  Future<void> selectAppointment(
    BuildContext context,
    int index,
  ) async {
    index == -1
        ? selectedAppointment = singleAppointment
        : selectedAppointment = appointmentList.elementAt(index);

    if (selectedAppointment!.readStatus != "read") {
      await _slotRepo.updateReadStatus(selectedAppointment!.appointmentId);
      if (unReadAppointment > 0) {
        unReadAppointment--;
      }
    }
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => PatientDetailsPage())));
    notifyListeners();
  }

  Future<void> fetchSingleAppointment(BuildContext context) async {
    isSingleLoading = true;
    notifyListeners();
    String doctorId =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    singleAppointment = await _slotRepo.fetchSingleAppointment(doctorId);

    isSingleLoading = false;
    notifyListeners();
  }
}

class SlotDataSource extends CalendarDataSource {
  SlotDataSource(List<SlotModel> slots) {
    List<SlotModel> slotList = slots;
    slotList.removeWhere((element) =>
        DateTime.now().millisecondsSinceEpoch >
        DateTime.parse(
                '${element.scheduleDate.toString().split(" ").first} ${element.startTime}')
            .millisecondsSinceEpoch);
    appointments = slotList;
  }
  SlotModel getSlot(int index) => appointments![index] as SlotModel;

  @override
  DateTime getStartTime(int index) {
    return DateTime.parse(
        '${getSlot(index).scheduleDate.toString().split(" ").first} ${getSlot(index).startTime}');
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.parse(
        '${getSlot(index).scheduleDate.toString().split(" ").first} ${getSlot(index).endTime}');
    // return DateTime(3000);
  }

  @override
  String getSubject(int index) {
    return getSlot(index).avgSlotTiming;
  }

  @override
  Color getColor(int index) {
    return getSlot(index).status == 'not book' ? Colors.red : Colors.green;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }
}
