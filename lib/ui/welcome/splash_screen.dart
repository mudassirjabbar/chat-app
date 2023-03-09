import 'dart:async';

import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(const Duration(seconds: 1), () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            statusBarColor: Colors.white));
        if (finalEmail == null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const LoginScreen();
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomePage();
          }));
        }
        // Get.to(finalEmail == null ? const LoginScreen() : const HomePage());
      });
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Text('Chat App'),
      )),
    );
  }
}
