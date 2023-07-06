// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testui2/baslangicekranlari/girisekrani.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/assets/UVPROTECTION.png"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
