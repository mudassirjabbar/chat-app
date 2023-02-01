import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/signup_screen.dart';
import 'package:chat_app/ui/welcome/widgets/custom_buton.dart';
import 'package:chat_app/ui/welcome/widgets/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          text: 'Welcome to ',
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
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'To get started enter your Email and password',
                  style: TextStyle(color: Color(0xff140E25)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldInput(
                    textEditingController: _email,
                    hintText: 'Enter your email',
                    isPass: false,
                    textInputType: TextInputType.text,
                    icon: Icons.email_outlined,
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
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () {
                    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email.text, password: _password.text)
                          .then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        final snackBar = SnackBar(
                          content: Text('Error is ${error.toString()}'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    } else {
                      const snackBar = SnackBar(
                        backgroundColor: Colors.yellow,
                        content: Text(
                          'One of Password or email field is empty',
                          style: TextStyle(color: Colors.black),
                        ),
                        duration: Duration(seconds: 5),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  text: 'Login',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: Color(0xff140E25),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
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
}
