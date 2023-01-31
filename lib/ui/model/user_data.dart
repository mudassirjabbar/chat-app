import 'package:flutter/cupertino.dart';

class UserChat {
  Image? profileImg;
  String? id;
  String? userName;
  String? lastMessage;
  DateTime? lastMsgTime;
  double? numOfUnreadMsgs;

  UserChat(
    this.profileImg,
    this.id,
    this.userName,
    this.lastMessage,
    this.lastMsgTime,
    this.numOfUnreadMsgs,
  );

  UserChat.fromJson(Map<String, dynamic> json) {
    profileImg = json['profileimag'];
    id = json['id'];
    userName = json['userName'];
    lastMessage = json['lastMessage'];
    lastMsgTime = json['lastMsgTime'];
    numOfUnreadMsgs = json['numOfUnreadMsgs'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['lastMessage'] = lastMessage;
    data['lastMsgTime'] = lastMsgTime;
    data['numOfUnreadMsgs'] = numOfUnreadMsgs;
    return data;
  }
}
