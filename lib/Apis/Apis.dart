import 'package:chat_app/ui/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  // userinfo;
  //for Authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
// for getting current user
  static User get user => auth.currentUser!;
  // for checking if user exists or not
  static Future<bool> userExists() async {
    return (await firestore
            .collection('users')
            .doc(auth.currentUser!.uid)
            .get())
        .exists;
  }

  static Future<Map<String, dynamic>> getUser() async {
    dynamic json = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .get();
    return json;
  }

  // for creating a new user
  static Future<void> createUser({
    required name,
    required age,
    required email,
  }) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> json = await getUser();
    var su = UserData.fromJson(json);

    // final chatUser = UserData(
    //     profileImg: user.photoURL ?? '',
    //     about: user.about.toString(),
    //     userName: user.displayName ?? '',
    //     createdAt: time,
    //     isOnline: false,
    //     id: user.uid,
    //     lastActive: time,
    //     email: user.email.toString(),
    //     pushToken: '');

    return await firestore.collection('users').doc(user.email).set({});
  }
}
