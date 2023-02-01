import 'package:chat_app/ui/welcome/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 80),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Create ',
                      style: TextStyle(color: Color(0xFF140E25), fontSize: 24),
                    ),
                    TextSpan(
                      text: 'Chat',
                      style: TextStyle(color: Color(0xFF140E25), fontSize: 24),
                    ),
                    TextSpan(
                      text: 'App ',
                      style: TextStyle(color: Color(0xFF00D2AA), fontSize: 24),
                    ),
                    TextSpan(
                      text: 'Account',
                      style: TextStyle(color: Color(0xFF140E25), fontSize: 24),
                    ),
                  ]),
                ),
              ],
            ),
            TextFieldInput(
                textEditingController: _userName,
                hintText: 'Enter your user name',
                isPass: false,
                textInputType: TextInputType.text,
                icon: Icons.title),
          ],
        ),
      )),
    );
  }
}
