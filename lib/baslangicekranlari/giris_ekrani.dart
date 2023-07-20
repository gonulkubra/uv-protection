import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uv_protection/servisler/giris_hizmetleri.dart';
import 'package:uv_protection/sabitler/kalici_sabitler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final firebaseAuth = FirebaseAuth.instance;
final renkler = Renkler();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
String emailaddress = "No Email Address";
String displayName = "Guest User";
String photoURL = "notFill";
//late String email, password;

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final firebaseauth = FirebaseAuth.instance;
  // GoogleSignInAccount? _currentUser;
  final girishizmetleri = GirisHizmetleri();

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
              const SizedBox(height: 10),
              welcomeText(),
              const SizedBox(height: 10),
              infoText(),
              const SizedBox(height: 10),
              emailField(),
              const SizedBox(height: 10),
              passwordField(),
              const SizedBox(height: 10),
              sifremiUnuttum(context),
              const SizedBox(height: 10),
              signInButton(),
              const SizedBox(height: 10),
              orContinueWith(),
              const SizedBox(height: 10),
              iconLogin(),
              const SizedBox(height: 10),
              registerText(),
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
    return const Center(
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
    return const Center(
      child: Text(
        "Sign in to continue",
        style: TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87),
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
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black87),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Password',
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  Padding signInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: () async {
          try {
            await firebaseAuth.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
            emailaddress = _emailController.text.trim();
            displayName = "No Name Info";
            if (context.mounted) Navigator.of(context).pushNamed("/HomePage");
          } on FirebaseAuthException catch (error) {
            Fluttertoast.showToast(
                msg: error.toString(), gravity: ToastGravity.TOP);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
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

  Padding orContinueWith() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text("Or continue with"),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Row iconLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            try {
              await signInWithGoogle().then((UserCredential user) {
                Navigator.of(context).pushNamed("/HomePage");
              });
            } catch (error) {
              Fluttertoast.showToast(
                  msg: error.toString(), gravity: ToastGravity.TOP);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            child: Image.asset(
              "assets/assets/google-logo.png",
              height: 35,
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () async {
            //final result = await girishizmetleri.misafirGirisiFonksiyonu();
            //Navigator.pushNamed(context, "/GuestScreen");
            Navigator.pushNamed(context, "/HomePage");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(238, 238, 238, 1),
            ),
            child: Image.asset(
              "assets/assets/guest-icon.png",
              height: 40,
            ),
          ),
        ),
      ],
    );
  }

  Padding registerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not a member?",
            style: TextStyle(
                color: Color(0xff040508),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(width: 4),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, "/RegisterPage"),
            child: const Text(
              "Register Now",
              style: TextStyle(
                  color: Color(0xff040508),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  TextButton registerNow() {
    return TextButton(
        onPressed: () => Navigator.pushNamed(context, "/RegisterPage"),
        child: const Text("Don't have an account? Create new",
            style: TextStyle(
                color: Color(0xff040508),
                fontSize: 18,
                fontWeight: FontWeight.w500)));
  }

  Text signInAsaGuest() {
    return const Text(
      "Sign In as a Guest",
      style: TextStyle(
        color: Color(0xff040508),
        fontSize: 18,
        fontWeight: FontWeight.w500,
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
        //final result = await girishizmetleri.misafirGirisiFonksiyonu();
        //Navigator.pushNamed(context, "/GuestScreen");
        Navigator.pushNamed(context, "/HomePage");
      },
    );
  }

/*   TextButton signInGoogle() {
    return TextButton(
        onPressed: () async {
          signInWithGoogle().then((UserCredential user) {
            Navigator.of(context).pushNamed("/HomePage");
          }).catchError((e) => print(e));
        },
        child: Text("Google Sign In",
            style: TextStyle(
                color: Color(0xff040508),
                fontSize: 18,
                fontWeight: FontWeight.w500)));
  }
 */
/*   Column enAltSatir() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [misafirGirisiMetodu(), registerNow(), signInGoogle()],
    );
  } */

  Padding sifremiUnuttum(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, "/ResetPassword"),
            child: const Text(
              "Forgot your password?",
              style: TextStyle(
                  color: Color(0xff040508),
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    emailaddress = googleUser?.email ?? "Guest User";
    photoURL = googleUser?.photoUrl ?? photoURL;
    displayName = googleUser?.displayName ?? displayName;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
