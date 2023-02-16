import 'package:chat_app/ui/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIs {
  //for Authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
// for getting current user
  static get user => auth.currentUser!;
  // for checking if user exists or not
  static Future<bool> userExists() async {
    return (await firestore
            .collection('users')
            .doc(auth.currentUser!.uid)
            .get())
        .exists;
  }

  // for creating a new user
  static Future<bool> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    print(auth.currentUser!.photoURL);
    return true;

    // final chatUser = UserData(
    //     profileImg: user.photoURL,
    //     about: user.about.toString(),
    //     userName: user.displayName.toString(),
    //     createdAt: time,
    //     isOnline: false,
    //     id: user.uid,
    //     lastActive: time,
    //     email: user.email.toString(),
    //     pushToken: '');
    // return await firestore
    //     .collection('users')
    //     .doc(user.uid)
    //     .set(chatUser.toJson());
  }
}
