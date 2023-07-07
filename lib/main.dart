// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testui2/sabitler/tema.dart';
import 'package:testui2/servisler/sifreyiyenile.dart';
import 'package:testui2/uygulamaekranlari/anaekran.dart';
import 'package:testui2/uygulamaekranlari/haritaekrani.dart';
import 'package:testui2/baslangicekranlari/ekrandegistirme.dart';
import 'package:testui2/baslangicekranlari/girisekrani.dart';
import 'package:testui2/baslangicekranlari/kayitekrani.dart';
import 'package:testui2/baslangicekranlari/splash.dart';
import 'package:testui2/uygulamaekranlari/otomatekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<themeColorData>(
      create: (BuildContext context) => themeColorData(), child: MyApp()));
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
        "/ResetPassword": (context) => SifreyiYenile(),
        "/AutomatScreen": (context) => OtomatEkrani(),
      },
      title: 'UV Protection App Demo',
      theme: Provider.of<themeColorData>(context).themeColor,
      home: const Splash(),
    );
  }
}
