import 'package:flutter/material.dart';
import 'package:the_mindsmith/constants/text_style.dart';

class ChatBoxWidget extends StatefulWidget {
  ChatBoxWidget({Key? key, required this.time, required this.message, required this.byDoc,required this.isContinued})
      : super(key: key);
  DateTime time;
  String message;
  bool byDoc;
  bool isContinued;

  @override
  State<ChatBoxWidget> createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:widget.isContinued?const EdgeInsets.only(left:20,right: 20): const EdgeInsets.only(top:16.0),
      child: Row(
        mainAxisAlignment:
            widget.byDoc ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
        if ( widget.byDoc&& !widget.isContinued)
            const CircleAvatar(
                backgroundColor: Colors.black, child: Icon(Icons.person)),
                
            Padding(
              padding:   widget.isContinued?const EdgeInsets.all(6): const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [const BoxShadow(
                    offset: const Offset(1, 1),blurRadius: 2
                  )],
                  color: widget.byDoc?Colors.white:const Color.fromARGB(255, 223, 255, 232),
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width - 180,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(widget.message,style: text3,)),
                       const SizedBox(width: 20,),
                       Text("${widget.time.hour}:${widget.time.minute}")
                    ],
                  ),
                ),
              ),
            ),
          if (!widget.byDoc && ! widget.isContinued)
            const CircleAvatar(
                backgroundColor: Colors.black, child: const Icon(Icons.person)),

        ],
      ),
    );
  }
}
