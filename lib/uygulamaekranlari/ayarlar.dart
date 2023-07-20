// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uv_protection/sabitler/tema.dart';
import 'package:uv_protection/baslangicekranlari/girisekrani.dart';
import 'package:uv_protection/servisler/girishizmetleri.dart';
import "package:uv_protection/sabitler/kalicisabitler.dart";

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final girishizmetleri = GirisHizmetleri();
  String dil = "English";
  List<String> diller = ["English"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 137, 147, 241),
        body: Column(
          children: [
            SizedBox(height: 70),
            rectAvatar(),
            SizedBox(height: 10),
            displayNameField(),
            SizedBox(height: 10),
            emailTextAlani(),
            SizedBox(height: 50),
            settingsText(),
            SizedBox(height: 1),
            languageField(),
            SizedBox(height: 10),
            themeSection(),
            SizedBox(height: 40),
            sifreyiYenile(),
            SizedBox(height: 15),
            cikisyap(),
            SizedBox(height: 20),
            version()
          ],
        ));
  }

  CircleAvatar circleA() {
    return CircleAvatar(
      radius: 48, // Image radius
      backgroundImage: NetworkImage(photoURL),
    );
  }

  ClipRRect rectAvatar() {
    if (photoURL != "notFill") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(48), // Image radius
          child: Image.network(photoURL, fit: BoxFit.cover),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Image border
      child: SizedBox.fromSize(
        size: Size.fromRadius(48), // Image radius
        child: Image(
          image: AssetImage('assets/assets/cat-face.png'),
        ),
      ),
    );
  }

  Text emailTextAlani() {
    return Text(
      emailaddress,
      style: TextStyle(
          fontFamily: 'Rajdhani', fontWeight: FontWeight.w700, fontSize: 18),
    );
  }

  Text displayNameField() {
    return Text(
      displayName,
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

  Padding languageField() {
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
                            girishizmetleri.cikisYap();
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
