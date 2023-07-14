// ignore_for_file: body_might_complete_normally_nullable, duplicate_ignore, prefer_const_constructors, use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testui2/servisler/girishizmetleri.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final firebaseAuth = FirebaseAuth.instance;
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
              emailfield(),
              SizedBox(height: 25),
              passwordfield(),
              SizedBox(height: 25),
              signin(context),
              SizedBox(height: 5),
              enaltsatir(),
              sifremiunuttum(context)
            ],
          ),
        )),
      ),
    );
  }

  TextButton signin(BuildContext context) {
    return TextButton(
        onPressed: () async {
          try {
            await firebaseAuth.signInWithEmailAndPassword(
                email: email, password: password);
            Navigator.of(context).pushNamed("/HomePage");
          } on FirebaseAuthException catch (error) {
            Fluttertoast.showToast(
                msg: error.toString(), gravity: ToastGravity.TOP);
          }
        },
        child: Text("Giriş yap",
            style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)));
  }

  Row sifremiunuttum(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/ResetPassword"),
          child: Text(
            "Şifremi Unuttum",
            style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.purple,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
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
        Navigator.pushNamed(context, "/GuestScreen");
      },
    );
  }

  Text signinasaguest() {
    return Text(
      "Sign In as a Guest",
      style: TextStyle(
        fontFamily: 'Rajdhani',
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text misafirgirisi() {
    return Text(
      "Misafir Girişi",
      style: TextStyle(
          fontFamily: 'Rajdhani',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
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
        style: TextStyle(
          fontFamily: 'Rajdhani',
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Center text() {
    return Center(
      child: Text(
        "Devam etmek için giriş yapın ",
        style: TextStyle(
            fontFamily: 'Rajdhani', fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextButton registernow() {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, "/RegisterPage"),
        child: Text("Hesap Oluştur",
            style: TextStyle(
                fontFamily: 'Rajdhani',
                color: Colors.black,
                fontSize: 18,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Şifre",
                hintStyle: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            onChanged: (value) {
              setState(() {
                password = value.trim();
              });
            },
          ),
        ),
      ),
    );
  }

  Padding emailfield() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                      fontFamily: 'Rajdhani',
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              onChanged: (value) {
                setState(() {
                  email = value.trim();
                });
              },
            ),
          )),
    );
  }
}
