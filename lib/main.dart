import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDSQ6ZNSLX0cBtnKd_tVmJ7BFOoMp7sPts",
        projectId: "chat-app-d0244",
        messagingSenderId: "196050837264",
        appId: "1:196050837264:web:dc82d64c984638b27ecf95"),
  );
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
