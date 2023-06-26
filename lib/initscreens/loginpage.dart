// ignore_for_file: body_might_complete_normally_nullable, duplicate_ignore, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
  final firebaseauth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sunpng(height),
              SizedBox(height: 30),
              welcometext(),
              SizedBox(height: 10),
              text(),
              SizedBox(height: 20),
              usernamefield(),
              SizedBox(height: 20),
              passwordfield(),
              SizedBox(height: 20),
              signin(),
              SizedBox(height: 5),
              registernow()
            ],
          ),
        )),
      ),
    );
  }

  SizedBox sunpng(double height) {
    return SizedBox(
        height: height * 0.3, child: Image.asset("assets/assets/sun.png"));
  }

  Center welcometext() {
    return Center(
      child: Text(
        "Hoş Geldin !",
        style: GoogleFonts.rajdhani(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }

  Center text() {
    return Center(
      child: Text(
        "Devam etmek için giriş yapın ",
        style: GoogleFonts.rajdhani(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextButton registernow() {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, "/RegisterPage"),
        child: Text("Üye değil misiniz? Şimdi Kayıt Olun",
            style: GoogleFonts.rajdhani(
                fontSize: 20, fontWeight: FontWeight.bold)));
  }

  TextButton signin() {
    return TextButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            // ignore: unused_local_variable
            final userresult = await firebaseauth.signInWithEmailAndPassword(
                email: email, password: password);
            Navigator.pushNamed(context, "/HomePage");
          }
        },
        child: Text("Giriş yap",
            style: GoogleFonts.rajdhani(
                fontSize: 30, fontWeight: FontWeight.bold)));
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
            hintText: "Password",
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
              InputDecoration(border: InputBorder.none, hintText: "Username"),
        ),
      ),
    );
  }
}
