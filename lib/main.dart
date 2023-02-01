import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff5F5F3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffFFFFFF),
          foregroundColor: Color(0xff00D2AA),
        ),
      ),
      routes: {
        "/": (context) => const SignUpScreen(),
        "homePage": (context) => const HomePage(),
        "chatPage": (context) => const ChatPage(),
      },
    );
  }
}
