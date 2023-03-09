import 'dart:io';

import 'package:chat_app/ui/welcome/widgets/custom_buton.dart';
import 'package:chat_app/ui/welcome/widgets/custom_textField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String? username;
  String? about;
  XFile? profile;
  File? file;
  String? imageUrl;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          var data = snapshot.data;

          //  data.data['']
          if (snapshot.hasData) {
            about = data!['about'];
            username = data['user_name'];
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Stack(children: [
                    data['profile'].toString().length < 10
                        ? const CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage('assets/images.png'),
                          )
                        : CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage('${data['profile']}'),
                          ),
                    // profile == null
                    //     ? CircleAvatar(
                    //         radius: 70,
                    //         backgroundImage: NetworkImage('${data['profile']}'),
                    //       )
                    //     : CircleAvatar(
                    //         radius: 70,
                    //         backgroundImage: FileImage(File(profile!.path)),
                    //       ),
                    // Image.file(File(profile!.path))
                    // :

                    // CircleAvatar(
                    //     radius: 70,
                    //     backgroundImage:
                    //         NetworkImage('${data!['profile']}'),
                    //   ),
                    Positioned(
                      top: 90,
                      left: 100,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey, //New
                                blurRadius: 25.0,
                                offset: Offset(0, -10))
                          ],
                        ),
                        child: InkWell(
                          onTap: () {
                            pickImage(context);
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Color(0xff00D2AA),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  Text('${data['email']}'),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: TextFieldInput(
                        onChange: (value) {
                          username = value;
                        },
                        initialValue: '${data['user_name']}',
                        // textEditingController: _nameController,
                        hintText: 'Name',
                        isPass: false,
                        textInputType: TextInputType.text,
                        icon: Icons.person_outline,
                        validator: (_) {
                          return;
                        }),
                  ),
                  const SizedBox(height: 10),
                  TextFieldInput(
                      onChange: (value) {
                        about = value;
                      },
                      initialValue: '${data['about']}',
                      // textEditingController: _aboutController,
                      hintText: 'About',
                      isPass: false,
                      textInputType: TextInputType.text,
                      icon: Icons.info_outline,
                      validator: (_) {
                        return;
                      }),
                  const SizedBox(height: 40),
                  CustomButton(
                      text: 'Update',
                      onTap: () async {
                        if (username != null &&
                            about != null &&
                            imageUrl != null) {
                          await updateUserInfo(imageUrl!, username!, about!)
                              .whenComplete(() {
                            const snackBar = SnackBar(
                              backgroundColor: Colors.yellow,
                              content: Text(
                                'Updated Sucessfully',
                                style: TextStyle(color: Colors.black),
                              ),
                              duration: Duration(seconds: 5),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        } else {
                          const snackBar = SnackBar(
                            backgroundColor: Colors.yellow,
                            content: Text(
                              'No Changes Applied',
                              style: TextStyle(color: Colors.black),
                            ),
                            duration: Duration(seconds: 5),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      })
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var email = sharedPreferences.getString(
      'email',
    );
    DocumentSnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    return data;
  }

  Future updateUserInfo(String url, String userName, String about) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var email = sharedPreferences.getString(
      'email',
    );
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      await FirebaseFirestore.instance.collection('users').doc(email).update(
        {
          'profile': url,
          'email': email,
          'user_name': userName,
          'about': about,
        },
      );
    }
  }

  // pick image function
  final picker = ImagePicker();
  XFile? pickedFile;

  Future pickImageSource(bool imageSource) async {
    final pickedFile = await picker.pickImage(
        source: imageSource ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);

    if (pickedFile != null) {
      setState(() {
        profile = pickedFile;
        _uploadImage(pickedFile);
        //  profile = pickedFile.name as XFile?;
      });
    }
  }

  // upload image on firebase storage
  _uploadImage(XFile? newpickedFile) async {
    if (newpickedFile == null) return;
    // getting a reference to storage root
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('product')
        .child('${FirebaseAuth.instance.currentUser!.email}');
    try {
      //  storing the file

      await ref.putFile(File(newpickedFile.path));
      // getting the download url of stored image
      setState(() async {
        imageUrl = await ref.getDownloadURL();
      });

      profile = (await ref.getDownloadURL()) as XFile?;
    } catch (e) {
      print(e);
    }
  }

  pickImage(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      pickImageSource(true);
                      Navigator.pop(context);
                    },
                    child: const ListTile(
                      leading: Icon(Icons.camera),
                      title: Text('Camera'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pickImageSource(false);
                      Navigator.pop(context);
                    },
                    child: const ListTile(
                      leading: Icon(Icons.image),
                      title: Text('Gallery'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
