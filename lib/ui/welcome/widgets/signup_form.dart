import 'package:chat_app/ui/welcome/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController userName,
    required TextEditingController email,
    required TextEditingController password,
    required TextEditingController confirmPassword,
  })  : _formKey = formKey,
        _userName = userName,
        _email = email,
        _password = password,
        _confirmPassword = confirmPassword;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _userName;
  final TextEditingController _email;
  final TextEditingController _password;
  final TextEditingController _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Column(
          children: [
            TextFieldInput(
                textEditingController: _userName,
                hintText: 'Enter your user name',
                isPass: false,
                textInputType: TextInputType.text,
                icon: Icons.person_2_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'User name is required';
                  } else {
                    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Enter correct user name';
                    }
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
                  if (value!.isEmpty) {
                    return 'Email is required';
                  } else {
                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return 'Enter valid email address';
                    }

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
                    return 'Please re-enter password';
                  } else {
                    if (value != _password.text) {
                      return 'Enter the correct password';
                    }
                  }
                  return null;
                }),
          ],
        ));
  }
}
