import 'package:flutter/material.dart';
import 'package:testui2/uygulamaekranlari/haritaekrani.dart';

class MisafirEkrani extends StatefulWidget {
  const MisafirEkrani({super.key});

  @override
  State<MisafirEkrani> createState() => _MisafirEkraniState();
}

class _MisafirEkraniState extends State<MisafirEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () => Navigator.pushNamed(context, "/LoginPage"),
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Diğer özellikleri kullanabilmek için giriş yapın",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            const Row(
              children: [MapScreen()],
            )
          ],
        ));
  }
}
