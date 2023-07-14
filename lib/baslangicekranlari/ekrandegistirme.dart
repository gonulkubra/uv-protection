// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:testui2/uygulamaekranlari/anaekran.dart';
import 'package:testui2/uygulamaekranlari/haritaekrani.dart';
import 'package:testui2/uygulamaekranlari/ayarlar.dart';
import 'package:testui2/uygulamaekranlari/navigasyon.dart';
// ignore: unused_import

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _FirstPageState();
}

class _FirstPageState extends State<HomePage> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      MainPage(),
      NavigationScreen(),
      MapScreen(),
      SettingScreen()
    ];
    void onTabTapped(int index) {
      setState(() {
        currentindex = index;
      });
    }

    return Scaffold(
        body: screens[currentindex],
        backgroundColor: Colors.white,
        bottomNavigationBar: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 10,
            tabBackgroundColor: Colors.grey.shade800,
            selectedIndex: currentindex,
            onTabChange: (index) => onTabTapped(index),
            tabs: [
              GButton(
                icon: Icons.home,
                text: "Anasayfa",
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.navigation_sharp,
                text: "Navigasyon",
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.map,
                text: "Harita",
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.settings,
                text: "Profil",
                iconColor: Colors.white,
              )
            ]));
  }
}
