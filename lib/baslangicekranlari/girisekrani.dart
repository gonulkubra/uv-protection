// ignore_for_file: body_might_complete_normally_nullable, duplicate_ignore, prefer_const_constructors, use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testui2/main.dart';
import 'package:testui2/servisler/girishizmetleri.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final renkler = Renkler();
late String email, password;

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final firebaseauth = FirebaseAuth.instance;
  final girishizmetleri = girisHizmetleri();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: renkler.girisekranlari,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sunpng(height),
              SizedBox(height: 25),
              welcometext(),
              SizedBox(height: 10),
              text(),
              SizedBox(height: 25),
              usernamefield(),
              SizedBox(height: 25),
              passwordfield(),
              SizedBox(height: 25),
              signin(),
              SizedBox(height: 5),
              enaltsatir(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, "/ResetPassword"),
                    child: Text(
                      "Şifremi Unuttum",
                      style: GoogleFonts.rajdhani(
                          color: Colors.purple,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  Row enaltsatir() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [registernow(), misafirgirisimetodu()],
    );
  }

  TextButton misafirgirisimetodu() {
    return TextButton(
      child: Column(
        children: [
          misafirgirisi(),
          signinasaguest(),
        ],
      ),
      onPressed: () async {
        final result = await girishizmetleri.misafirgirisifonksiyonu();
        Navigator.pushNamed(context, "/MapScreen");
      },
    );
  }

  Text signinasaguest() {
    return Text(
      "Sign In as a Guest",
      style: GoogleFonts.rajdhani(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Text misafirgirisi() {
    return Text(
      "Misafir Girişi",
      style: GoogleFonts.rajdhani(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  SizedBox sunpng(double height) {
    return SizedBox(
        height: height * 0.3, child: Image.asset("assets/assets/sun.png"));
  }

  Center welcometext() {
    return Center(
      child: Text(
        "Merhaba",
        style: GoogleFonts.rajdhani(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }

  Center text() {
    return Center(
      child: Text(
        "Devam etmek için giriş yapın ",
        style: GoogleFonts.rajdhani(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextButton registernow() {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, "/RegisterPage"),
        child: Text("Hesap Oluştur",
            style: GoogleFonts.rajdhani(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)));
  }

  TextButton signin() {
    return TextButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            final result =
                girishizmetleri.kayitlikullanicigirisi(email, password);
            Navigator.pushNamed(context, "/HomePage");
            setState(() {
              registereduser = true;
            });
          }
        },
        child: Text("Giriş yap",
            style: GoogleFonts.rajdhani(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)));
  }

  Padding passwordfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(18)),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Bilgileri eksiksiz giriniz";
            } else {}
          },
          onSaved: (value) {
            password = value!;
          },
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Şifre",
          ),
        ),
      ),
    );
  }

  Padding usernamefield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(18)),
        child: TextFormField(
          // ignore: body_might_complete_normally_nullable
          validator: (value) {
            if (value!.isEmpty) {
              return "Bilgileri eksiksiz giriniz";
            } else {}
          },
          onSaved: (value) {
            email = value!;
          },
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: "Email"),
        ),
      ),
    );
  }
}
