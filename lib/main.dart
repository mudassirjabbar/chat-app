import 'dart:io';

import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/ui/welcome/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'My chat app',
    options: const FirebaseOptions(
      apiKey: "AIzaSyDSQ6ZNSLX0cBtnKd_tVmJ7BFOoMp7sPts",
      projectId: "chat-app-d0244",
      messagingSenderId: "196050837264",
      appId: "1:196050837264:web:dc82d64c984638b27ecf95",
      storageBucket: "com.example.chat_app",
    ),
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
        "/": (context) => const SplashScreen(),
        "homePage": (context) => const HomePage(),
        "chatPage": (context) => const ChatPage(
              userName: '',
              profilePicture: '',
            ),
      },
    );
  }
}

// error num 1 = chat avatar not showing
// app not opening in web
// how to pass chat user to chat screen  
// search icon cursor remain tapped upon tapping outside search field
// pic updates late when updating and shows no updates done
