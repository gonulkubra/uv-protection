import 'package:flutter/material.dart';
import 'package:uv_protection/uygulamaekranlari/ana_ekran.dart';
import 'package:uv_protection/uygulamaekranlari/harita_ekrani.dart';
import 'package:uv_protection/uygulamaekranlari/ayarlar.dart';
import 'package:uv_protection/uygulamaekranlari/navigasyon.dart';
import 'package:uv_protection/uygulamaekranlari/otomat_ekrani.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _FirstPageState();
}

class _FirstPageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const MainPage(),
      const MapScreen(),
      const NavigationScreen(),
      const OtomatEkrani(),
      const SettingScreen(),
    ];
    void onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: Center(
        child: screens[_selectedIndex],
      ),
      backgroundColor:
          const Color.fromARGB(255, 137, 147, 241), //body arka plan rengi kubra
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            activeIcon: Icon(Icons.map_outlined),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            activeIcon: Icon(Icons.navigation),
            label: 'Navigation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Automat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
