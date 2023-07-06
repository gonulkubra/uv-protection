import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        title: Text("Şifreyi Yenile"),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              "Şifre Yenileme Bağlantısı gönderebilmemiz için bir e-posta adresi girin",
              textAlign: TextAlign.center,
              style: GoogleFonts.rajdhani(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Email",
                  fillColor: Colors.grey,
                  filled: true),
            ),
          ),
          SizedBox(height: 40),
          MaterialButton(
            onPressed: () {
              if (email == _emailcontroller) {
                try {
                  girishizmetleri.sifreyenile(_emailcontroller);
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
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
                      return AlertDialog(
                          content: Text("Lütfen E-posta adresinizi girin"));
                    });
              }
            },
            child: Text(
              "Şifreyi Yenile",
              style: GoogleFonts.rajdhani(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            color: Colors.deepPurple[400],
          )
        ],
      ),
    );
  }
}
