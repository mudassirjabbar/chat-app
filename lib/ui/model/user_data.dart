import 'package:flutter/cupertino.dart';

class UserChat {
  final Image? profileImg;
  final String id;
  final String userName;
  final String? lastMessage;
  final DateTime lastMsgTime;
  final double? numOfUnreadMsgs;

  UserChat(
    this.profileImg,
    this.id,
    this.userName,
    this.lastMessage,
    this.lastMsgTime,
    this.numOfUnreadMsgs,
  );
}
