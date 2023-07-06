import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';

class OtomatEkrani extends StatefulWidget {
  const OtomatEkrani({super.key});

  @override
  State<OtomatEkrani> createState() => _OtomatEkraniState();
}

String selectedCity = "Antalya";
String selectedDistrict = 'Alanya';
int stock = 5;
bool separateFromOtomat = false;

class _OtomatEkraniState extends State<OtomatEkrani> {
  final renkler = Renkler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, "/HomePage"),
            icon: Icon(Icons.chevron_left)),
        title: Text(
          'Otomat 1',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            SunscreenWidget(),
            SizedBox(height: 32.0),
            Text(
              'Stok Bilgisi: $stock tane',
              style: GoogleFonts.rajdhani(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                setState(() {
                  stock--;
                });
              },
              child: Text(
                'Satın Al',
                style: GoogleFonts.rajdhani(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 26.0),
            CheckboxListTile(
              title: Text(
                'Otomattan Ayır',
                style: GoogleFonts.rajdhani(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
              value: separateFromOtomat,
              onChanged: (value) {
                setState(() {
                  separateFromOtomat = value!;
                });
              },
            ),
            if (separateFromOtomat) SizedBox(height: 16.0),
            if (separateFromOtomat)
              Text(
                'Seçilen adres: $selectedCity - $selectedDistrict',
                style: GoogleFonts.rajdhani(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}

class SunscreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.wb_sunny,
          size: 100.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
