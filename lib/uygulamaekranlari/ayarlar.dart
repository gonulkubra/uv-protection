// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testui2/sabitler/tema.dart';
//import 'package:testui2/baslangicekranlari/girisekrani.dart'; // kubra email
import 'package:testui2/servisler/girishizmetleri.dart';
import "package:testui2/sabitler/kalicisabitler.dart";

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final girishizmetleri = girisHizmetleri();
  String dil = "English";
  List<String> diller = ["English"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Column(
          children: [
            SizedBox(height: 90),
            avataralani(),
            emailtextalani(),
            SizedBox(height: 15),
            geneltext(),
            SizedBox(height: 15),
            ilksatir(context),
            SizedBox(height: 15),
            hesaptext(),
            SizedBox(height: 15),
            ikincisatir(),
            SizedBox(height: 15),
            cikisyap(),
            SizedBox(height: 44),
            version()
          ],
        ));
  }

  Row version() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "version $appversion",
          style: TextStyle(
              fontFamily: 'Rajdhani',
              fontSize: 15,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  Text emailtextalani() {
    return Text(
      "_emailControll", // kubra
      style: TextStyle(
          fontFamily: 'Rajdhani', fontWeight: FontWeight.w700, fontSize: 18),
    );
  }

  Container avataralani() {
    return Container(
      height: 75,
      width: 75,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen[100]),
      child: Icon(
        Icons.account_circle_outlined,
        color: Colors.black,
      ),
      alignment: Alignment.center,
    );
  }

  Row cikisyap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 229, 53, 91)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 25),
                        Text("Log Out")
                      ],
                    ),
                    content: Text("Do you want to sign out?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontFamily: 'Rajdhani',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      TextButton(
                          onPressed: () {
                            girishizmetleri.cikisyap();
                            Navigator.of(context).pushNamed("/LoginPage");
                          },
                          child: Text(
                            "Log Out",
                            style: TextStyle(
                                fontFamily: 'Rajdhani',
                                color: const Color.fromARGB(255, 229, 53, 91),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  );
                });
          },
          icon: Icon(Icons.logout_outlined), //icon data for elevated button
          label: Text("Log Out",
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)), //label text
        )
      ],
    );
  }

  Padding ikincisatir() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [sifreyiyenile()],
      ),
    );
  }

  Container sifreyiyenile() {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Text(
              "Password",
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.blue[800]),
                onPressed: () => Navigator.pushNamed(context, "/ResetPassword"),
                child: Text(
                  "Reset password",
                  style: TextStyle(
                    fontFamily: 'Rajdhani',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Container emailalani() {
    return Container(
      height: 150,
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Text(
              "Email",
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Doğrulanmadı",
              style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5),
            Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  Row hesaptext() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(width: 10),
      Text(
        "Security",
        style: TextStyle(
            fontFamily: 'Rajdhani', fontSize: 28, fontWeight: FontWeight.bold),
      )
    ]);
  }

  Padding ilksatir(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dilalani(),
          koyutema(context),
        ],
      ),
    );
  }

  Container koyutema(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Text(
              "Dark Theme",
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SwitchListTile(
                  value: Provider.of<ThemeColorData>(context).isDarkMode,
                  onChanged: (_) {
                    Provider.of<ThemeColorData>(context, listen: false)
                        .temadegistir();
                  }),
            )
          ],
        ),
      ),
    );
  }

  Container dilalani() {
    return Container(
      height: 150,
      width: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Text(
              "Language",
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: dil,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: diller.map((String location) {
                    return DropdownMenuItem(
                        value: location,
                        child: Text(
                          location,
                          style: TextStyle(
                              fontFamily: 'Rajdhani',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dil = newValue!;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Row geneltext() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(width: 10),
      Text(
        "Genel",
        style: TextStyle(
            fontFamily: 'Rajdhani', fontSize: 28, fontWeight: FontWeight.bold),
      )
    ]);
  }
}
