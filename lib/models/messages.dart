import 'package:chat_app_ui/models/model.dart';

class Messages {
  Messages({
    this.sender,
    this.receiver,
    this.msg,
    this.isRead,
    this.createdAt,
  });

  Users? sender;
  Users? receiver;
  String? msg;
  bool? isRead;
  String? createdAt;

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
      sender: Users.fromJson(json['sender']),
      receiver: Users.fromJson(json['receiver']),
      msg: json['msg'],
      isRead: json['isRead'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'sender': sender!.toJson(),
        'receiver': receiver!.toJson(),
        'msg': msg,
        'isRead': isRead,
        'createdAt': createdAt,
      };
}
