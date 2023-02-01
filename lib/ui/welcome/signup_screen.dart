import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/login_screen.dart';
import 'package:chat_app/ui/welcome/widgets/custom_buton.dart';
import 'package:chat_app/ui/welcome/widgets/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 80),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Create ',
                          style:
                              TextStyle(color: Color(0xFF140E25), fontSize: 24),
                        ),
                        TextSpan(
                          text: 'Chat',
                          style:
                              TextStyle(color: Color(0xFF140E25), fontSize: 24),
                        ),
                        TextSpan(
                          text: 'App ',
                          style:
                              TextStyle(color: Color(0xFF00D2AA), fontSize: 24),
                        ),
                        TextSpan(
                          text: 'Account',
                          style:
                              TextStyle(color: Color(0xFF140E25), fontSize: 24),
                        ),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFieldInput(
                        textEditingController: _userName,
                        hintText: 'Enter your user name',
                        isPass: false,
                        textInputType: TextInputType.text,
                        icon: Icons.person_2_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldInput(
                        textEditingController: _email,
                        hintText: 'Enter your email',
                        isPass: false,
                        textInputType: TextInputType.text,
                        icon: Icons.email_outlined,
                        validator: (value) {
                          if (!_email.text.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                            return 'Email is invalid';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldInput(
                        textEditingController: _password,
                        hintText: 'Enter Password',
                        isPass: true,
                        textInputType: TextInputType.number,
                        icon: Icons.lock_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldInput(
                        textEditingController: _confirmPassword,
                        hintText: 'confirm password',
                        isPass: true,
                        textInputType: TextInputType.number,
                        icon: Icons.lock_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }),
                  ],
                )),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () {},
                  text: 'Sign Up',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Color(0xff140E25),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xff3C286E),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? emailValidator(String email) {
    if (!email.contains(
      RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
    )) {
      return 'Email is invalid';
    }
    return null;
  }
}





// if (_email.text.isNotEmpty &&
                    //     _userName.text.isNotEmpty &&
                    //     _password.text.isNotEmpty &&
                    //     _confirmPassword.text.isNotEmpty) {
                    //   FirebaseAuth.instance
                    //       .createUserWithEmailAndPassword(
                    //           email: _email.text, password: _password.text)
                    //       .then((value) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => HomePage(),
                    //         ));
                    //   }).onError((error, stackTrace) {
                    //     final snackBar = SnackBar(
                    //       backgroundColor: Colors.yellow,
                    //       content: Text(
                    //         'The error is ${error.toString()}',
                    //         style: const TextStyle(color: Colors.black),
                    //       ),
                    //       duration: const Duration(seconds: 5),
                    //     );
                    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   });
                    // } else {
                    //   const snackBar = SnackBar(
                    //     backgroundColor: Colors.yellow,
                    //     content: Text(
                    //       'Make sure all fields are entered',
                    //       style: TextStyle(color: Colors.black),
                    //     ),
                    //     duration: Duration(seconds: 5),
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // }