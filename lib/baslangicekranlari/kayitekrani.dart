// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable, prefer_const_constructors, use_build_context_synchronously

import 'package:testui2/servisler/girishizmetleri.dart';
import 'package:flutter/material.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final renkler = Renkler();

class _RegisterPageState extends State<RegisterPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            sunpng(height),
            SizedBox(height: 30),
            hesapolustur(),
            SizedBox(height: 10),
            SizedBox(height: 20),
            emailfield(),
            SizedBox(height: 20),
            sifrealani(),
            SizedBox(height: 20),
            hesapolusturbutonu(),
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

  Center hesapolustur() {
    return Center(
      child: Text(
        "Hesap Oluştur",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  TextButton hesapolusturbutonu() {
    return TextButton(
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            girishizmetleri.hesapac(email, password);
            formkey.currentState!.reset();
            showDialog(
                context: context,
                builder: (context) {
                  return Text("Hesap oluşturuldu,");
                });
            Navigator.pushNamed(context, "/LoginPage");
          }
        },
        child: Text(
          "Devam et",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }

  Padding sifrealani() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(18)),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty || value.length < 6) {
              return "Şifre en az 6 karakter içermelidir";
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

  Padding emailfield() {
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
