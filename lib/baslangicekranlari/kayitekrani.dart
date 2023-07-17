// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable, prefer_const_constructors, use_build_context_synchronously

import 'package:uv_protection/servisler/girishizmetleri.dart';
import 'package:flutter/material.dart';
import 'package:uv_protection/sabitler/kalicisabitler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final renkler = Renkler();

class _RegisterPageState extends State<RegisterPage> {
  late String email, password;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
            // hesapolustur(),
            testEmailField(),
            SizedBox(height: 20),
            testPasswordField(),
            SizedBox(height: 20),
            // emailfield(),
            // SizedBox(height: 20),
            // sifrealani(),
            // SizedBox(height: 20),
            testCreateAccountButton(),
            SizedBox(height: 20),
            // hesapolusturbutonu(),
            // SizedBox(height: 5),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, "/LoginPage"),
              child: Text(
                "<-- Back to Login Page",
                style: TextStyle(
                  color: Color(0xff040508),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
        )),
      ),
    );
  }

  SizedBox sunpng(double height) {
    return SizedBox(
        height: height * 0.3, child: Image.asset("assets/assets/sun.png"));
  }

/*   Center hesapolustur() {
    return Center(
      child: Text(
        "Create Account",
        style: TextStyle(
            color: Colors.black54, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  } */

  Padding testEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Email',
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Padding testPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Password',
          fillColor: Colors.white,
          filled: true,
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
              return "Enter the information completely";
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
              return "Password must contain at least 6 characters";
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

  Padding testCreateAccountButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: () async {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            girishizmetleri.hesapac(
                _emailController.text.trim(), _passwordController.text.trim());
            formkey.currentState!.reset();
            showDialog(
                context: context,
                builder: (context) {
                  return Text("Account created.");
                });
            Navigator.pushNamed(context, "/LoginPage");
          }
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Create Account',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton hesapolusturbutonu() {
    return TextButton(
      onPressed: () async {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          girishizmetleri.hesapac(
              _emailController.text.trim(), _passwordController.text.trim());
          formkey.currentState!.reset();
          showDialog(
              context: context,
              builder: (context) {
                return Text("Account created.");
              });
          Navigator.pushNamed(context, "/LoginPage");
        }
      },
      child: Text(
        "Create Account",
        style: TextStyle(
            color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
