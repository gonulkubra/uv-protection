// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uv_protection/sabitler/tema.dart';
import 'package:uv_protection/servisler/sifreyiyenile.dart';
import 'package:uv_protection/uygulamaekranlari/anaekran.dart';
import 'package:uv_protection/uygulamaekranlari/haritaekrani.dart';
import 'package:uv_protection/uygulamaekranlari/misafirekrani.dart';
import 'package:uv_protection/uygulamaekranlari/navigasyon.dart';
import 'package:uv_protection/baslangicekranlari/ekrandegistirme.dart';
import 'package:uv_protection/baslangicekranlari/girisekrani.dart';
import 'package:uv_protection/baslangicekranlari/kayitekrani.dart';
import 'package:uv_protection/baslangicekranlari/splash.dart';
import 'package:uv_protection/uygulamaekranlari/otomatekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(), child: MyApp()));
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
        "/Navigasyon": (context) => NavigationScreen(),
        "/ResetPassword": (context) => SifreyiYenile(),
        "/AutomatScreen": (context) => OtomatEkrani(),
        "/GuestScreen": (context) => MisafirEkrani()
      },
      title: 'UV Protection App Demo',
      theme: Provider.of<ThemeColorData>(context).themeColor,
      home: const Splash(),
    );
  }
}
