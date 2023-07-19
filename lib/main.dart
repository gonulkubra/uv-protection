import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uv_protection/sabitler/tema.dart';
import 'package:uv_protection/servisler/sifreyiyenile.dart';
import 'package:uv_protection/uygulamaekranlari/haritaekrani.dart';
import 'package:uv_protection/uygulamaekranlari/misafirekrani.dart';
import 'package:uv_protection/uygulamaekranlari/navigasyon.dart';
import 'package:uv_protection/baslangicekranlari/ekrandegistirme.dart';
import 'package:uv_protection/baslangicekranlari/girisekrani.dart';
import 'package:uv_protection/baslangicekranlari/kayitekrani.dart';
import 'package:uv_protection/uygulamaekranlari/otomatekrani.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  FlutterNativeSplash.remove();
  runApp(ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/LoginPage": (context) => const LoginPage(),
        "/RegisterPage": (context) => const RegisterPage(),
        "/HomePage": (context) => const HomePage(),
        "/MapScreen": (context) => const MapScreen(),
        "/Navigasyon": (context) => const NavigationScreen(),
        "/ResetPassword": (context) => const SifreyiYenile(),
        "/AutomatScreen": (context) => const OtomatEkrani(),
        "/GuestScreen": (context) => const MisafirEkrani(),
      },
      title: 'UV Protection App Demo',
      theme: Provider.of<ThemeColorData>(context).themeColor,
      home: const LoginPage(),
    );
  }
}
