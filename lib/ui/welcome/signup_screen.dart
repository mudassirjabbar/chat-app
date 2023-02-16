import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/login_screen.dart';
import 'package:chat_app/ui/welcome/widgets/custom_buton.dart';
import 'package:chat_app/ui/welcome/widgets/custom_textField.dart';
import 'package:chat_app/ui/welcome/widgets/rich_text.dart';
import 'package:chat_app/ui/welcome/widgets/signup_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _ageController.dispose();
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
                const TitleRichText(),
                const SizedBox(
                  height: 20,
                ),
                SignUpForm(
                  formKey: _formKey,
                  userName: _userName,
                  email: _email,
                  password: _password,
                  confirmPassword: _confirmPassword,
                  ageController: _ageController,
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: signUp,
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

  Future signUp() async {
    // Create User
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text)
          .then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      }).onError((error, stackTrace) {
        final snackBar = SnackBar(
          backgroundColor: Colors.yellow,
          content: Text(
            'The error is ${error.toString()}',
            style: const TextStyle(color: Colors.black),
          ),
          duration: const Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      const snackBar = SnackBar(
        backgroundColor: Colors.yellow,
        content: Text(
          'Make sure all fields are entered',
          style: TextStyle(color: Colors.black),
        ),
        duration: Duration(seconds: 5),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //add user details
    addUserDetails(_userName.text.toString(),
        int.parse(_ageController.text.toString()), _email.text.toString());
  }

  Future addUserDetails(String userName, int age, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'user name': userName,
      'age': age,
      'email': email,
    });
  }
}
