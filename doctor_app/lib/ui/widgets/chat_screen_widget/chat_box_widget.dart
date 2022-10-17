import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';

class ChatBoxWidget extends StatefulWidget {
  const ChatBoxWidget(
      {Key? key,
      required this.time,
      required this.message,
      required this.byUser,
      required this.isContinued})
      : super(key: key);
  final String message;
  final bool byUser;
  final bool isContinued;
  final DateTime time;

  @override
  State<ChatBoxWidget> createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isContinued
          ? const EdgeInsets.only(left: 50, right: 50)
          : const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment:
            widget.byUser ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (widget.byUser && !widget.isContinued)
            const CircleAvatar(
                backgroundColor: Colors.black, child: Icon(Icons.person)),
          Padding(
            padding: widget.isContinued
                ? const EdgeInsets.all(6)
                : const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(offset: Offset(1, 1), blurRadius: 2)
                  ],
                  color: widget.byUser
                      ? Colors.white
                      : const Color.fromARGB(255, 223, 255, 232),
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width - 180,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      widget.message,
                      style: text3,
                    )),
                    const SizedBox(
                      width: 20,
                    ),
                    Text("${widget.time.hour}:${widget.time.minute}")
                  ],
                ),
              ),
            ),
          ),
          if (!widget.byUser && !widget.isContinued)
            const CircleAvatar(
                backgroundColor: Colors.black, child: Icon(Icons.person))
        ],
      ),
    );
  }
}
