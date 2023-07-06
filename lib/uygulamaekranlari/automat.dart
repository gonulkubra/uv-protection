import 'package:flutter/material.dart';

void main() => runApp(SunscreenApp());

class SunscreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunscreen Otomatı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SunscreenScreen(),
    );
  }
}

class SunscreenScreen extends StatefulWidget {
  @override
  _SunscreenScreenState createState() => _SunscreenScreenState();
}

class _SunscreenScreenState extends State<SunscreenScreen> {
  List<String> cities = [
    'Adana',
    'Ankara',
    'İstanbul',
    'İzmir',
    // Diğer illeri buraya ekleyin
  ];

  Map<String, List<String>> districts = {
    'Adana': ['Seyhan', 'Yüreğir', 'Çukurova', 'Sarıçam', 'Karaisalı'],
    'Ankara': ['Çankaya', 'Yenimahalle', 'Keçiören', 'Etimesgut', 'Sincan'],
    'İstanbul': ['Kadıköy', 'Beşiktaş', 'Şişli', 'Beyoğlu', 'Fatih'],
    'İzmir': ['Konak', 'Bornova', 'Karşıyaka', 'Buca', 'Gaziemir'],
    // Diğer ilçeleri buraya ekleyin
  };

  String selectedCity = '';
  String selectedDistrict = '';
  int stock = 5;
  bool separateFromOtomat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sunscreen Otomatı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SunscreenWidget(),
            SizedBox(height: 16.0),
            Text('İl Seçin:'),
            DropdownButton<String>(
              value: selectedCity,
              onChanged: (value) {
                setState(() {
                  selectedCity = value!;
                });
              },
              items: cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text('İlçe Seçin:'),
            DropdownButton<String>(
              value: selectedDistrict,
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value!;
                });
              },
              items: districts[selectedCity]?.map((district) {
                return DropdownMenuItem<String>(
                  value: district,
                  child: Text(district),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            Text('Stok Bilgisi: $stock tane'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  stock--;
                });
              },
              child: Text('Satın Al'),
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Otomattan Ayır'),
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
                style: TextStyle(fontWeight: FontWeight.bold),
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
