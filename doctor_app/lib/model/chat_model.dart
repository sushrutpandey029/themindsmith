

class ChatModel {

    String chatId;
    String senderId;
    String senderName;
    String receiverId;
    String receiverName;
    String txtMsg;
    DateTime dateTime;
  ChatModel({
    required this.chatId,
    required this.senderId,
    required this.senderName,
    required this.receiverId,
    required this.receiverName,
    required this.txtMsg,
    required this.dateTime,
  });

    factory ChatModel.fromMap(Map<String, dynamic> json) => ChatModel(
        chatId: json["id"],
        senderId: json["sender_id"],
        senderName: json["sender_name"],
        receiverId: json["receiver_id"],
        receiverName: json["receiver_name"],
        txtMsg: json["txt_msg"],
        dateTime: DateTime.parse(json["datetime"]),
    );

    Map<String, dynamic> toMap() => {
        "id": chatId,
        "sender_id": senderId,
        "sender_name": senderName,
        "receiver_id": receiverId,
        "receiver_name": receiverName,
        "txt_msg": txtMsg,
        "datetime": dateTime.toIso8601String(),
    };

  @override
  String toString() {
    return 'ChatModel(chatId: $chatId, senderId: $senderId, senderName: $senderName, receiverId: $receiverId, receiverName: $receiverName, txtMsg: $txtMsg, dateTime: $dateTime)';
  }
}
