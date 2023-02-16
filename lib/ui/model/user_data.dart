class UserData {
  late final String profileImg;
  late final String about;
  late final String userName;
  late final String createdAt;
  late final bool isOnline;
  late final String id;
  late final String lastActive;
  late final String email;
  late final String pushToken;
  // late final DateTime lastMsgTime;
  // late final double numOfUnreadMsgs;

  UserData({
    required this.profileImg,
    required this.about,
    required this.userName,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.email,
    required this.pushToken,
    // required this.lastMsgTime,
    // required this.numOfUnreadMsgs,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    profileImg = json['profile_image'];
    about = json['about'];
    userName = json['user_name'];
    createdAt = json['created_at'];
    isOnline = json['is_online'];
    id = json['id'];
    lastActive = json['last_active'];
    email = json['email'];
    pushToken = json['push_token'];
    // lastMsgTime = json['last_msg_time'];
    // numOfUnreadMsgs = json['num_of_unread_msgs'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile_image'] = profileImg;
    data['about'] = about;
    data['user_name'] = userName;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['email'] = email;
    data['push_token'] = pushToken;
    // data['last_msg_time'] = lastMsgTime;
    // data['num_of_unread_msgs'] = numOfUnreadMsgs;
    return data;
  }
}
