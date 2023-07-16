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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

/*   @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  } */

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
              welcomeText(),
              SizedBox(height: 10),
              infoText(),
              SizedBox(height: 25),
              testEmailField(),
              SizedBox(height: 25),
              testPasswordField(),
              SizedBox(height: 25),
              testSignInButton(),
              SizedBox(height: 25),
              // emailField(),
              // SizedBox(height: 25),
              // passwordField(),
              // SizedBox(height: 25),
              // signIn(context),
              // SizedBox(height: 5),
              enAltSatir(),
              sifremiUnuttum(context)
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

  Center welcomeText() {
    return Center(
      child: Text(
        "Welcome",
        style: TextStyle(
          color: Colors.black54,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Center infoText() {
    return Center(
      child: Text(
        "Sign in to continue",
        style: TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

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

  Padding emailField() {
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
                  hintText: "E-Posta",
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

  Padding passwordField() {
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

  Padding testSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: () async {
          try {
            await firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
            Navigator.of(context).pushNamed("/HomePage");
          } on FirebaseAuthException catch (error) {
            Fluttertoast.showToast(
                msg: error.toString(), gravity: ToastGravity.TOP);
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
              'Sign In',
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

  TextButton signIn(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: () async {
          try {
            await firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
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

  TextButton registerNow() {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, "/RegisterPage"),
        child: Text("Don't have an account? Create new",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500)));
  }

  /* Text misafirGirisi() {
    return Text(
      "Misafir Girişi",
      style: TextStyle(
          fontFamily: 'Rajdhani',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  } */

  Text signInAsaGuest() {
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

  TextButton misafirGirisiMetodu() {
    return TextButton(
      child: Column(
        children: [
          signInAsaGuest(),
        ],
      ),
      onPressed: () async {
        //final result = await girishizmetleri.misafirgirisifonksiyonu();
        //Navigator.pushNamed(context, "/GuestScreen");
        Navigator.pushNamed(context, "/HomePage");
        print("veni vidi vici");
      },
    );
  }

  Column enAltSatir() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [misafirGirisiMetodu(), registerNow()],
    );
  }

  Row sifremiUnuttum(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => Navigator.pushNamed(context, "/ResetPassword"),
          child: Text(
            "Forgot your password?",
            style: TextStyle(
                color: Color.fromARGB(255, 79, 72, 145),
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
