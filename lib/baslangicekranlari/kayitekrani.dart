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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                sunpng(height),
                SizedBox(height: 30),
                emailField(),
                SizedBox(height: 20),
                passwordField(),
                SizedBox(height: 20),
                createAccountButton(),
                SizedBox(height: 20),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox sunpng(double height) {
    return SizedBox(
        height: height * 0.3, child: Image.asset("assets/assets/sun.png"));
  }

  Padding emailField() {
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

  Padding passwordField() {
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

  Padding createAccountButton() {
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
}
