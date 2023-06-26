// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String username, password;
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            sunpng(height),
            SizedBox(height: 30),
            welcometext(),
            SizedBox(height: 10),
            SizedBox(height: 20),
            usernamefield(),
            SizedBox(height: 20),
            passwordfield(),
            SizedBox(height: 20),
            signin(),
            SizedBox(height: 5),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, "/LoginPage"),
                icon: Icon(Icons.chevron_left))
          ]),
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
        "Hesap Oluştur",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextButton signin() {
    return TextButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            var userresult = await firebaseauth.createUserWithEmailAndPassword(
                email: username, password: password);
            formkey.currentState!.reset();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Hesap oluşturuldu, Lütfen giriş yapın")));
            Navigator.pushNamed(context, "/LoginPage");
          }
        },
        child: Text(
          "Devam et",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ));
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
          validator: (value) {
            if (value!.isEmpty) {
              return "Bilgileri eksiksiz giriniz";
            } else {}
          },
          onSaved: (value) {
            username = value!;
          },
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: "Username"),
        ),
      ),
    );
  }
}
