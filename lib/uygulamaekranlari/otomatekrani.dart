import 'package:flutter/material.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';

class OtomatEkrani extends StatefulWidget {
  const OtomatEkrani({super.key});

  @override
  State<OtomatEkrani> createState() => _OtomatEkraniState();
}

String selectedCity = "Antalya";
String selectedDistrict = 'Alanya';
int stock = 12;
bool separateFromOtomat = false;

class _OtomatEkraniState extends State<OtomatEkrani> {
  final renkler = Renkler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, "/HomePage"),
            icon: const Icon(Icons.chevron_left)),
        title: const Text(
          'Otomat 1',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const SunscreenWidget(),
            const SizedBox(height: 32.0),
            Text(
              'Stok Bilgisi: $stock tane',
              style: const TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                if (stock != 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(
                          "Ürün rezerve edildi,60 dakika içerisinde almazsanız iptal edilecektir",
                          style: TextStyle(
                            fontFamily: 'Rajdhani',
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {
                    stock--;
                  });
                } else if (stock == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(
                          "Stokta ürün kalmamıştır",
                          style: TextStyle(
                            fontFamily: 'Rajdhani',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text(
                'Satın Al',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 26.0),
            CheckboxListTile(
              title: const Text(
                'Otomattan Ayır',
                style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              value: separateFromOtomat,
              onChanged: (value) {
                setState(() {
                  separateFromOtomat = value!;
                });
              },
            ),
            if (separateFromOtomat) const SizedBox(height: 16.0),
            if (separateFromOtomat)
              Text(
                'Seçilen adres: $selectedCity - $selectedDistrict',
                style: const TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}

class SunscreenWidget extends StatelessWidget {
  const SunscreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.wb_sunny,
          size: 100.0,
          color: Colors.orange,
        ),
      ),
    );
  }
}
