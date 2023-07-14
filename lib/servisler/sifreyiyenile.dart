import 'package:flutter/material.dart';
import 'package:testui2/baslangicekranlari/girisekrani.dart';
import 'package:testui2/servisler/girishizmetleri.dart';

class SifreyiYenile extends StatefulWidget {
  const SifreyiYenile({super.key});

  @override
  State<SifreyiYenile> createState() => _SifreyiYenileState();
}

class _SifreyiYenileState extends State<SifreyiYenile> {
  final girishizmetleri = girisHizmetleri();
  final _emailcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Şifreyi Yenile"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "Şifre Yenileme Bağlantısı gönderebilmemiz için bir e-posta adresi girin",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rajdhani',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Email",
                  fillColor: Colors.grey,
                  filled: true),
            ),
          ),
          const SizedBox(height: 40),
          MaterialButton(
            onPressed: () {
              if (email == _emailcontroller) {
                try {
                  girishizmetleri.sifreyenile(_emailcontroller);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text(
                              "Bağlantı gönderildi,e-postanızı kontrol edin"),
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
                          content: Text("Lütfen E-posta adresinizi girin"));
                    });
              }
            },
            color: Colors.black,
            child: const Text(
              "Şifreyi Yenile",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Rajdhani',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
