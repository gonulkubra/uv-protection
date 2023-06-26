// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:testui2/appscreens/mapscreen.dart';
import 'package:testui2/initscreens/firstpage.dart';
import 'package:testui2/initscreens/loginpage.dart';
import 'package:testui2/initscreens/registerpage.dart';
import 'package:testui2/initscreens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/LoginPage": (context) => LoginPage(),
        "/RegisterPage": (context) => RegisterPage(),
        "/HomePage": (context) => HomePage(),
        "/MapScreen": (context) => MapScreen(),
      },
      title: 'UV Protection App Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
