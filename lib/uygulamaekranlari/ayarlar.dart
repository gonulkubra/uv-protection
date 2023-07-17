// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testui2/sabitler/tema.dart';
import 'package:testui2/baslangicekranlari/girisekrani.dart'; // kubra email
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
        backgroundColor: Color.fromARGB(255, 137, 147, 241),
        body: Column(
          children: [
            SizedBox(height: 90),
            avatarAlani(),
            SizedBox(height: 10),
            emailTextAlani(),
            SizedBox(height: 50),
            settingsText(),
            SizedBox(height: 25),
            testLanguage(),
            //ilksatir(context),
            SizedBox(height: 10),
            themeSection(),
            //hesaptext(),
            SizedBox(height: 40),
            sifreyiYenile(),
            SizedBox(height: 15),
            cikisyap(),
            SizedBox(height: 20),
            version()
          ],
        ));
  }

  Container avatarAlani() {
    return Container(
      height: 75,
      width: 75,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue[200]),
      child: Icon(
        Icons.account_circle_outlined,
        color: Colors.black,
      ),
      alignment: Alignment.center,
    );
  }

  Text emailTextAlani() {
    return Text(
      emailaddress, // kubra
      style: TextStyle(
          fontFamily: 'Rajdhani', fontWeight: FontWeight.w700, fontSize: 18),
    );
  }

  Padding settingsText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          "Settings",
          style: TextStyle(
              fontFamily: 'Rajdhani',
              fontSize: 28,
              fontWeight: FontWeight.bold),
        )
      ]),
    );
  }

  Padding testLanguage() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Language: ",
            style: TextStyle(
                fontFamily: 'Rajdhani',
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
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
    );
  }

  Padding ilksatir(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          dilalani(),
          koyutema(context),
        ],
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

  Container sifreyiYenile() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.blue[800]),
          onPressed: () => Navigator.pushNamed(context, "/ResetPassword"),
          child: Text(
            "[Reset Password]",
            style: TextStyle(
              fontFamily: 'Rajdhani',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
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

  Padding themeSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SwitchListTile(
        title: const Text(
          "Dark Theme:",
          style: TextStyle(
              fontFamily: 'Rajdhani',
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        value: Provider.of<ThemeColorData>(context).isDarkMode,
        onChanged: (_) {
          Provider.of<ThemeColorData>(context, listen: false).temadegistir();
        },
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
        child: Row(
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          children: [
            Text(
              "Language: ",
              style: TextStyle(
                  fontFamily: 'Rajdhani',
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
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

  Row version() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
}
