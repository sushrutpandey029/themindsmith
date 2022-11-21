import 'dart:async';
import 'dart:developer';

import 'package:doctor_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/chat_model.dart';
import '../model/doctor_model.dart';
import '../repo/chat_repo.dart';
import '../ui/screens/chat_screen.dart';
import 'auth_provider.dart';

class ChatProvider extends ChangeNotifier {
  bool isSending = false;
  bool isLoading = false;
  int? initialIndex;
  // int? finalIndex;
  bool isClosed = false;
  String? selectedUserId;
  final ChatRepo _chatRepo = ChatRepo();
  List<ChatModel> finalChatList = [];
  List<ChatModel> allReceivedChatList = [];
  List<UserModel> userList = [];
  List<String> userIdList = [];
  DoctorModel? doctorModel;

  void disposechat() {
    finalChatList.clear();
    allReceivedChatList.clear();
  }

  Future<void> fetchReceivedChat(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    String docId =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!.doctorId;
    doctorModel = Provider.of<AuthProvider>(context, listen: false).doctorModel;
    allReceivedChatList = await _chatRepo.fetchUserChat(docId);

    allReceivedChatList.sort((a, b) {
      return b.dateTime.compareTo(a.dateTime);
    });

    fetchUserList();
    isLoading = false;
    notifyListeners();
  }

  fetchUserList() {
    List<UserModel> list = [];
    List<String> idList = [];
    for (ChatModel element in allReceivedChatList) {
      if (idList.contains(element.senderId)) {
        continue;
      }
      idList.add(element.senderId);
      list.add(UserModel(
          userId: element.senderId,
          userName: element.senderName,
          userRegNo: ''));
    }
    userIdList = idList;
    userList = list;
  }

  Future<void> selcetUserId(String userId, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    selectedUserId = userId;
    await fetchChat(userId, context);

    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ChatPage()));
    notifyListeners();
  }

  Future<void> fetchChat(String userId, BuildContext context) async {
    if (isClosed == true) {
      // disposechat();
      isClosed = false;
    }
    DoctorModel doctorModel =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!;
    List<ChatModel> doctorChat =
        await _chatRepo.fetchDoctorChat(doctorModel.doctorId);
    doctorChat.removeWhere((element) => element.receiverId != userId);

    List<ChatModel> userChat = allReceivedChatList;
//  print(allReceivedChatList);
    userChat.removeWhere((element) => element.senderId != userId);
    // print(userId);
    // print(userChat);
    // print(doctorChat);
    finalChatList.clear();
    finalChatList.addAll(doctorChat);
    finalChatList.addAll(userChat);

    finalChatList.sort((a, b) {
      return a.dateTime.compareTo(b.dateTime);
    });

    print(finalChatList);

    initialIndex = finalChatList.length - 20;

// finalIndex = finalChatList.length;
    if (initialIndex! < 0) {
      initialIndex = 0;
    }
    autoReloadMessages(
      userId,
    );
    notifyListeners();
  }

  Future<void> sendMessage(BuildContext context, String message) async {
    isSending = true;
    print(isSending);
    notifyListeners();
    DoctorModel doctorModel =
        Provider.of<AuthProvider>(context, listen: false).doctorModel!;

    await _chatRepo.sendMessage(selectedUserId!, selectedUserId!,
        doctorModel.doctorId, doctorModel.doctorName, message);
    await fetchReceivedChat(context);
    await fetchChat(selectedUserId!, context);
    isSending = false;
    print(isSending);
    notifyListeners();
  }

  void previousChat() {
    initialIndex = initialIndex! - 20;
    // finalIndex = finalIndex! - 10;
    if (initialIndex! < 0) {
      initialIndex = 0;
      // finalIndex = initialIndex! + 10;
    }
    notifyListeners();
  }

  // void nextChat() {
  //   initialIndex = initialIndex! + 10;
  //   finalIndex = finalIndex! + 10;
  //   if (finalIndex! > finalChatList.length) {
  //     finalIndex = finalChatList.length;
  //     initialIndex = finalChatList.length - 10;
  //   }
  //   notifyListeners();
  // }

  Future<void> autoReloadMessages(String userId) async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (isClosed) {
        timer.cancel();
        return;
      } else {
        List<ChatModel> doctorChat =
            await _chatRepo.fetchDoctorChat(doctorModel!.doctorId);
        doctorChat.removeWhere((element) => element.receiverId != userId);

        List<ChatModel> userChat = allReceivedChatList;

        userChat.removeWhere((element) => element.senderId != userId);

        finalChatList.clear();
        finalChatList.addAll(doctorChat);
        finalChatList.addAll(userChat);

        finalChatList.sort((a, b) {
          return a.dateTime.compareTo(b.dateTime);
        });

        print(finalChatList);

        //  initialIndex = finalChatList.length - 10;

        // finalIndex = finalChatList.length;
        notifyListeners();
      }
    });
  }
}
