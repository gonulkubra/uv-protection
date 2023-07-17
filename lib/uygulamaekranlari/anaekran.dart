// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testui2/servisler/weather_data.dart';
import 'package:testui2/sabitler/sehirler.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';
import 'package:testui2/servisler/weather_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var city = "Istanbul";
  late Weather data;
  // late Weather passData;
  late Future<Weather> futureWeather;

  info() async {
    data = await getWeather(city);
    return data;
  }

  void updateInfo(city) async {
    futureWeather = getWeather(city);
  }

  @override
  void initState() {
    super.initState();
    futureWeather = getWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 137, 147, 241),
        body: FutureBuilder(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //passData = snapshot.data;
              return Container(
                child: Column(
                  children: [
                    dropdown(),
                    citycard(size, snapshot),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Image(
                image: AssetImage('assets/assets/splash-page.png'),
                fit: BoxFit.fill,
              );
            }
          },
        ));
  }

  Padding dropdown() {
    return Padding(
      padding: const EdgeInsets.only(top: 37.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.pin_drop),
          SizedBox(width: 5),
          DropdownButtonHideUnderline(
            child: DropdownButton(
                value: city,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: cities.map((String location) {
                  return DropdownMenuItem(
                      value: location, child: Text(location));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    city = newValue!;
                    updateInfo(city);
                  });
                }),
          ),
        ],
      ),
    );
  }

  Padding citycard(Size size, snapshot) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        height: size.height * 0.8,
        width: size.width,
        margin: EdgeInsets.only(right: 1, left: 1),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
                colors: [Color(0xffB389F1), Color(0xff89C7F1)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.3, 0.7])),
        child: Column(
          children: [
            SizedBox(height: 12),
            sehirisimalani(snapshot),
            ulke(snapshot),
            SizedBox(height: 4),
            tarih(),
            SizedBox(height: 15),
            havaiconu(size, snapshot),
            SizedBox(height: 3),
            havadurumu(snapshot),
            SizedBox(height: 15),
            ozoneText(),
            SizedBox(height: 20),
            iconlar(size, snapshot),
          ],
        ),
      ),
    );
  }

  Text ulke(snapshot) => Text(
        "${snapshot.data!.country}",
      );

  Padding sehirisimalani(snapshot) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: sehiradi(snapshot),
    );
  }

  Image havaiconu(Size size, snapshot) {
    if (snapshot.data!.icon == null) {
      return Image(
        image: AssetImage('assets/weather/day/119.png'),
      );
    } else if (snapshot.data!.isDay == 0) {
      return Image(
        image: AssetImage('assets/weather/night/113.png'),
      );
    } else {
      return Image(
        image: AssetImage('assets/weather/day/113.png'),
      );
    }
  }

  Padding iconlar(Size size, snapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ilksutun(size, snapshot),
          ikincisutun(size, snapshot),
          ucuncusutun(size, snapshot),
        ],
      ),
    );
  }

  Column ilksutun(Size size, snapshot) {
    return Column(
      children: [
        Text(
          "Temperature",
          style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        sicaklik(snapshot),
        SizedBox(height: 15),
        ruzgaricon(size),
        SizedBox(height: 10),
        ruzgarhizi(snapshot),
        SizedBox(height: 10),
        ruzgaryazi(),
        SizedBox(height: 15),
        gozlukIcon(size),
        SizedBox(height: 10),
        gozlukDurum(),
        SizedBox(height: 10),
        gozlukYazi(),
      ],
    );
  }

  Column ikincisutun(Size size, snapshot) {
    return Column(
      children: [
        Text(
          "UV",
          style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        uvdegeri(snapshot),
        SizedBox(height: 15),
        nemiconu(size),
        SizedBox(height: 10),
        nemdegeri(snapshot),
        SizedBox(height: 10),
        nemyazi(),
        SizedBox(height: 15),
        sapkaIconu(size),
        SizedBox(height: 10),
        sapkaDurum(),
        SizedBox(height: 10),
        sapkaYazi(),
      ],
    );
  }

  Column ucuncusutun(Size size, snapshot) {
    return Column(
      children: [
        Text(
          "SPF",
          style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        spfdegeri(snapshot),
        SizedBox(height: 15),
        evdekalicon(size, snapshot),
        SizedBox(height: 10),
        evdekalDurum(snapshot),
        SizedBox(height: 10),
        evdekalYazi(),
        SizedBox(height: 15),
        semsiyeIcon(size),
        SizedBox(height: 10),
        semsiyeDurum(),
        SizedBox(height: 10),
        semsiyeYazi(),
      ],
    );
  }

  Text spfdegeri(snapshot) {
    String spfvalue;
    double uv = snapshot.data!.uv;
    if (uv <= 1) {
      spfvalue = "0";
    } else if (uv < 3) {
      spfvalue = "15";
    } else if (uv <= 5) {
      spfvalue = "30";
    } else if (uv <= 7) {
      spfvalue = "50";
    } else {
      spfvalue = "50+";
    }
    return Text(
      "SPF $spfvalue",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 37,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text evdekalYazi() {
    return Text(
      "Status",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.45)),
    );
  }

  Text semsiyeYazi() {
    return Text(
      "Tip Note",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.45)),
    );
  }

  Text evdekalDurum(snapshot) {
    String statusText;
    double uv = snapshot.data!.uv;
    int isDay = snapshot.data!.isDay;
    if (isDay == 0) {
      statusText = "Drink Water";
    } else if (uv <= 3) {
      statusText = "Sunbath";
    } else if (uv <= 7) {
      statusText = "Drink Water";
    } else {
      statusText = "Stay at Home";
    }

    return Text(
      statusText,
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.85)),
    );
  }

  Text semsiyeDurum() {
    return Text(
      "Under Shade",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.85)),
    );
  }

  Image evdekalicon(Size size, snapshot) {
    double uv = snapshot.data!.uv;
    int isDay = snapshot.data!.isDay;
    if (isDay == 0) {
      return Image(
        image: AssetImage('assets/icons/glass-of-water.png'),
      );
    } else if (uv <= 3) {
      return Image(
        image: AssetImage('assets/icons/sunbathing.png'),
      );
    } else if (uv <= 7) {
      return Image(
        image: AssetImage('assets/icons/glass-of-water.png'),
      );
    } else {
      return Image(
        image: AssetImage('assets/icons/stay-at-home.png'),
      );
    }
  }

  Image semsiyeIcon(Size size) {
    return Image(
      image: AssetImage('assets/icons/parasol.png'),
    );
  }

  Text nemyazi() {
    return Text(
      "Humidity",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.45)),
    );
  }

  Text sapkaYazi() {
    return Text(
      "Tip Note",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.45)),
    );
  }

  Text nemdegeri(snapshot) {
    return Text(
      "%${snapshot.data!.humidity}",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.85)),
    );
  }

  Text sapkaDurum() {
    return Text(
      "Wear a Hat",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.85)),
    );
  }

  Image nemiconu(Size size) {
    return Image(
      image: AssetImage('assets/icons/humidity.png'),
    );
  }

  Image sapkaIconu(Size size) {
    return Image(
      image: AssetImage('assets/icons/mariachi.png'),
    );
  }

  Text uvdegeri(snapshot) {
    return Text(
      "${snapshot.data!.uv}",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 37,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text ruzgaryazi() {
    return Text(
      "Wind",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.45)),
    );
  }

  Text gozlukYazi() {
    return Text(
      "Tip Note",
      style: TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.45)),
    );
  }

  Text ruzgarhizi(snapshot) {
    return Text(
      "${snapshot.data!.wind} km/s",
      style: TextStyle(
        fontFamily: 'Archivo',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white.withOpacity(0.85),
      ),
    );
  }

  Text gozlukDurum() {
    return Text(
      "Sunglasses",
      style: TextStyle(
        fontFamily: 'Archivo',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white.withOpacity(0.85),
      ),
    );
  }

  Image ruzgaricon(Size size) {
    return Image(
      image: AssetImage('assets/icons/windy.png'),
    );
  }

  Image gozlukIcon(Size size) {
    return Image(
      image: AssetImage('assets/icons/sunglasses.png'),
    );
  }

  Text sicaklik(snapshot) {
    return Text(
      "${snapshot.data!.temp}°C",
      style: TextStyle(
        fontFamily: 'Archivo',
        fontSize: 37,
        fontWeight: FontWeight.w600,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Text ozoneText() {
    return Text(
      [
        "Plant a tree",
        "Bike more",
        "Drive less",
        "Conserve water",
        "Reduce - Reuse - Recycle",
        "Don't send chemicals into our waterways",
        "Choose sustainable",
        "Conserve electricity",
      ][Random().nextInt(8)],
      style: TextStyle(
        fontFamily: 'Archivo',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 11, 131, 77),
      ),
    );
  }

  Text havadurumu(snapshot) {
    return Text(
      "${snapshot.data!.condition}",
      style: TextStyle(
        fontFamily: 'Archivo',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xff5B69EC),
      ),
    );
  }

  Text tarih() {
    return Text(dateformat,
        style: TextStyle(
            fontFamily: 'Archivo', fontSize: 18, fontWeight: FontWeight.w400));
  }

  Text sehiradi(snapshot) {
    return Text(
      "${snapshot.data!.cityname}",
      style: TextStyle(
        fontFamily: 'Rajdhani',
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
