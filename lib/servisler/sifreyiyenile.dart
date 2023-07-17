import 'package:flutter/material.dart';
//import 'package:testui2/baslangicekranlari/girisekrani.dart';
import 'package:testui2/servisler/girishizmetleri.dart';

class SifreyiYenile extends StatefulWidget {
  const SifreyiYenile({super.key});

  @override
  State<SifreyiYenile> createState() => _SifreyiYenileState();
}

class _SifreyiYenileState extends State<SifreyiYenile> {
  final girishizmetleri = girisHizmetleri();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 136, 184),
      appBar: AppBar(
        title:
            const Text("Reset Password", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black54,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Enter an email address so we can send a Password Reset Link",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rajdhani',
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black87),
                    borderRadius: BorderRadius.circular(12)),
                hintText: "Email",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                if (_emailController.text.trim() != "") {
                  try {
                    girishizmetleri.sifreyenile(_emailController.text.trim());
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text("Link sent, check your email."),
                          );
                        });
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(content: Text(e.toString()));
                        });
                  }
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                            content:
                                Text("Please, enter your e-mail address."));
                      });
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
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          MaterialButton(
            onPressed: () {
              if (_emailController.text.trim() != "") {
                try {
                  girishizmetleri.sifreyenile(_emailController.text.trim());
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text("Link sent, check your email."),
                        );
                      });
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(content: Text(e.toString()));
                      });
                }
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                          content: Text("Please, enter your e-mail address."));
                    });
              }
            },
            /* color: Colors.black54,
            child: const Text(
              "Reset Password",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rajdhani',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ), */
          ),
        ],
      ),
    );
  }
}
