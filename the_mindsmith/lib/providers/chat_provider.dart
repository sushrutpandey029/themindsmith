import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_mindsmith/models/chat_model.dart';
import 'package:the_mindsmith/models/doctor_model.dart';
import 'package:the_mindsmith/providers/auth_provider.dart';
import 'package:the_mindsmith/services/repo/chat_repo.dart';
import 'package:the_mindsmith/ui/screens/chat_screen.dart';

class ChatProvider extends ChangeNotifier {
  bool isSending = false;
  DoctorModel? selectedDoctor;
  final ChatRepo _chatRepo = ChatRepo();
  List<ChatModel> finalChatList = [];
  int? initialIndex;
  // int? finalIndex;
  bool isClosed = false;

  Future<void> selectDoctor(DoctorModel doctor, BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    selectedDoctor = doctor;
    String userId = Provider.of<AuthProvider>(context, listen: false)
        .userResponse?['users']["id"];
    await fetchChat(userId);
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ChatPage()));
    notifyListeners();
  }

  Future<void> fetchChat(String userId) async {
    List<ChatModel> doctorChat =
        await _chatRepo.fetchDoctorChat(selectedDoctor!.doctorId);
    doctorChat.removeWhere((element) => element.receiverId != userId);

    List<ChatModel> userChat = await _chatRepo.fetchUserChat(userId);

    userChat.removeWhere(
        (element) => element.receiverId != selectedDoctor!.doctorId);

    finalChatList.clear();
    finalChatList.addAll(doctorChat);
    finalChatList.addAll(userChat);

    finalChatList.sort((a, b) {
      return a.dateTime.compareTo(b.dateTime);
    });

    initialIndex = finalChatList.length - 20;

    // finalIndex = finalChatList.length;
    if (initialIndex! < 0) {
      initialIndex = 0;
    }

    print(finalChatList);
    notifyListeners();
    autoReloadMessages(userId);
  }

  Future<void> sendMessage(BuildContext context, String message) async {
    isSending = true;

    Map<String, dynamic> userMap =
        Provider.of<AuthProvider>(context, listen: false).userResponse!;
    await _chatRepo.sendMessage(
        userMap['users']['id'],
        userMap['users']['user_name'],
        selectedDoctor!.doctorId,
        selectedDoctor!.doctorName,
        message);
    await fetchChat(userMap['users']['id']);
    // initialIndex = finalChatList.length - 10;
    // finalIndex = finalChatList.length;
    isSending = false;

    notifyListeners();
  }

  void previousChat() {
    isClosed = true;
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

  void autoReloadMessages(String userId) {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (isClosed) {
        timer.cancel();
        return;
      } else {
        List<ChatModel> doctorChat =
            await _chatRepo.fetchDoctorChat(selectedDoctor!.doctorId);
        doctorChat.removeWhere((element) => element.receiverId != userId);

        List<ChatModel> userChat = await _chatRepo.fetchUserChat(userId);

        userChat.removeWhere(
            (element) => element.receiverId != selectedDoctor!.doctorId);

        finalChatList.clear();
        finalChatList.addAll(doctorChat);
        finalChatList.addAll(userChat);

        finalChatList.sort((a, b) {
          return a.dateTime.compareTo(b.dateTime);
        });

        // initialIndex = finalChatList.length - 20;

        // finalIndex = finalChatList.length;
        // if(initialIndex!<0)
        // {
        //   initialIndex=0;
        // }

        print(finalChatList);
        notifyListeners();
      }
    });
  }
}
