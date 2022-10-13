import 'package:doctor_app/provider/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/button_style.dart';
import '../../constants/text_style.dart';
import '../widgets/chat_screen_widget/chat_box_widget.dart';
import '../widgets/comman/app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  TextEditingController _message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, null),
      body: WillPopScope(
        onWillPop: () async {
          Provider.of<ChatProvider>(context, listen: false).isClosed = true;
          return true;
        },
        child: Consumer<ChatProvider>(
          builder: (context, value, widget) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    reverse: true,
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18, bottom: 18, top: 18),
                    child: Column(
                      children: [
                        if (value.initialIndex != 0)
                          ElevatedButton(
                              style:  ElevatedButton.styleFrom(
                                          elevation: 8),
                              onPressed: () {
                                Provider.of<ChatProvider>(context,
                                        listen: false)
                                    .previousChat();
                              },
                              child: Text(
                                 value.finalChatList
                                            .elementAt(value.initialIndex!)
                                            .dateTime
                                            .toString()
                                            .substring(0, 10),
                              )),
                        for (int i = value.initialIndex!; i < value.finalChatList.length; i++)
                          Column(
                            children: [
                              if (i == 0 ||
                                  value.finalChatList[i - 1].dateTime.toString()
                                          .substring(0,10)
                                          !=
                                      value.finalChatList[i].dateTime.toString()
                                          .substring(0,10)
                                          )
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value.finalChatList[i].dateTime.toString()
                                            .substring(0,10),style:text3),
                                          ),
                              ChatBoxWidget(
                                time: value.finalChatList.elementAt(i).dateTime,
                                  message: value.finalChatList.elementAt(i).txtMsg,
                                  byUser: value.selectedUserId ==
                                      value.finalChatList.elementAt(i).senderId,
                                  isContinued: i == 0
                                      ? false
                                      : value.finalChatList.elementAt(i).senderId ==
                                          value.finalChatList
                                              .elementAt(i - 1)
                                              .senderId),
                            ],
                          ),
                        // if (value.finalIndex != value.finalChatList.length)
                        //   ElevatedButton(
                        //       style: smallBlackButtonStyle,
                        //       onPressed: () {
                        //         Provider.of<ChatProvider>(context,
                        //                 listen: false)
                        //             .nextChat();
                        //       },
                        //       child: Text('Next'))
                      ],
                    ),
                  )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 236, 236, 236),
                        boxShadow: [
                          BoxShadow(blurRadius: 6, offset: Offset(0, -3))
                        ],),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: TextField(
                              controller: _message,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                  hintText: "Enter Your message"),
                            ),
                          ),
                          value.isSending
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (_message.text.isNotEmpty) {
                                      await value.sendMessage(
                                          context, _message.text);
                                      _message.clear();
                                    }
                                  },
                                  icon: Icon(Icons.send,
                                      size: 28, color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
