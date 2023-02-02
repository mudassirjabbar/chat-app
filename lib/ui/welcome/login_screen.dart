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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool emailValidator = false;
  bool passwordValidator = false;

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
                Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFieldInput(
                            textEditingController: _email,
                            hintText: 'Enter your email',
                            isPass: false,
                            textInputType: TextInputType.text,
                            icon: Icons.email_outlined,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is required';
                              } else {
                                if (!RegExp(
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                    .hasMatch(value)) {
                                  return 'Enter valid email address';
                                }
                                emailValidator = true;

                                return null;
                              }
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
                              if (value!.isEmpty) {
                                return 'Enter your password';
                                // } else {
                                //   if (!RegExp(
                                //           r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                //       .hasMatch(value)) {
                                //     return 'Please enter password that should at least contains 8 characters including one upper & lower case, one digit and one special character';
                                //   }
                              }
                              passwordValidator = true;

                              return null;
                            }),
                      ],
                    )),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
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
                      final snackBar = SnackBar(
                        backgroundColor: Colors.yellow,
                        content: emailValidator == true &&
                                passwordValidator == false
                            ? const Text(
                                'Password field is empty',
                                style: TextStyle(color: Colors.black),
                              )
                            : emailValidator == false &&
                                    passwordValidator == true
                                ? const Text(
                                    'email field is empty',
                                    style: TextStyle(color: Colors.black),
                                  )
                                : emailValidator == false &&
                                        passwordValidator == false
                                    ? const Text(
                                        'Both fields are empty',
                                        style: TextStyle(color: Colors.black),
                                      )
                                    : const Text(''),
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
