import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uv_protection/servisler/weather_data.dart';
import 'package:uv_protection/sabitler/sehirler.dart';
import 'package:uv_protection/sabitler/kalici_sabitler.dart';
import 'package:uv_protection/servisler/weather_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var city = "Istanbul";
  late Future<Weather> futureWeather;

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 147, 241),
      body: FutureBuilder(
        future: futureWeather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                dropdown(),
                citycard(snapshot),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Please make sure, you have an internet connection",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "Please Wait \n\nWeather info is fetching right now.",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Padding dropdown() {
    return Padding(
      padding: const EdgeInsets.only(top: 37.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.pin_drop),
          const SizedBox(width: 5),
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

  Expanded citycard(snapshot) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 1, left: 1),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
                colors: [Color(0xffB389F1), Color(0xff89C7F1)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.3, 0.7])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HavaDurumuBlock(snapshot: snapshot),
            IlkSatir(snapshot: snapshot),
            IkinciSatir(snapshot: snapshot),
            const UcuncuSatir(),
          ],
        ),
      ),
    );
  }
}

class HavaDurumuBlock extends StatelessWidget {
  const HavaDurumuBlock({super.key, required this.snapshot});

  final AsyncSnapshot<Weather> snapshot;

  Image havaiconu() {
    String pathEnd = snapshot.data!.icon;
    if (snapshot.data!.isDay == 0) {
      return Image(
        image: AssetImage(
            'assets/weather/night/${pathEnd.substring(pathEnd.length - 7)}'),
      );
    } else if (snapshot.data!.isDay == 1) {
      return Image(
        image: AssetImage(
            'assets/weather/day/${pathEnd.substring(pathEnd.length - 7)}'),
      );
    }
    return const Image(
      image: AssetImage('assets/weather/day/113.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          snapshot.data!.cityname,
          style: const TextStyle(
            fontFamily: 'Rajdhani',
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(snapshot.data!.country),
        const SizedBox(height: 10),
        Text(
          dateformat,
          style: const TextStyle(
              fontFamily: 'Archivo', fontSize: 18, fontWeight: FontWeight.w400),
        ),
        havaiconu(),
        Text(
          snapshot.data!.condition,
          style: const TextStyle(
            fontFamily: 'Archivo',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xff5B69EC),
          ),
        ),
        const SizedBox(height: 10),
        Text(
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
          style: const TextStyle(
            fontFamily: 'Archivo',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 11, 131, 77),
          ),
        )
      ],
    );
  }
}

class IlkSatir extends StatelessWidget {
  const IlkSatir({super.key, required this.snapshot});

  final AsyncSnapshot<Weather> snapshot;

  String spfValue() {
    double uv = snapshot.data!.uv;
    if (uv <= 1) {
      return "0";
    } else if (uv < 3) {
      return "15";
    } else if (uv <= 5) {
      return "30";
    } else if (uv <= 7) {
      return "50";
    }
    return "50+";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: ColumnBuilder(
              title: "Temperature",
              value: "${snapshot.data!.temp.toInt().toString()}°C",
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: ColumnBuilder(
              title: "UV",
              value: snapshot.data!.uv.toInt().toString(),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: ColumnBuilder(
              title: "SPF",
              value: spfValue(),
            ),
          ),
        ),
      ],
    );
  }
}

class IkinciSatir extends StatelessWidget {
  const IkinciSatir({super.key, required this.snapshot});

  final AsyncSnapshot<Weather> snapshot;

  String statusText() {
    double uv = snapshot.data!.uv;
    int isDay = snapshot.data!.isDay;
    if (isDay == 0) {
      return "Drink Water";
    } else if (uv <= 3) {
      return "Sunbath";
    } else if (uv <= 7) {
      return "Drink Water";
    }
    return "Stay at Home";
  }

  String statusIconPath() {
    double uv = snapshot.data!.uv;
    int isDay = snapshot.data!.isDay;
    if (isDay == 0) {
      return 'assets/icons/glass-of-water.png';
    } else if (uv <= 3) {
      return 'assets/icons/sunbathing.png';
    } else if (uv <= 7) {
      return 'assets/icons/glass-of-water.png';
    }
    return 'assets/icons/stay-at-home.png';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: IconFieldBuilder(
              iconPath: 'assets/icons/windy.png',
              infoField: "${snapshot.data!.wind} km/s",
              fieldName: "Wind",
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: IconFieldBuilder(
              iconPath: 'assets/icons/humidity.png',
              infoField: "%${snapshot.data!.humidity}",
              fieldName: "Humidity",
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: IconFieldBuilder(
              iconPath: statusIconPath(),
              infoField: statusText(),
              fieldName: "Status",
            ),
          ),
        ),
      ],
    );
  }
}

class UcuncuSatir extends StatelessWidget {
  const UcuncuSatir({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: IconFieldBuilder(
              iconPath: 'assets/icons/sunglasses.png',
              infoField: "Sunglasses",
              fieldName: "Tip Note",
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: IconFieldBuilder(
              iconPath: 'assets/icons/mariachi.png',
              infoField: "Wear a Hat",
              fieldName: "Tip Note",
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: IconFieldBuilder(
              iconPath: 'assets/icons/parasol.png',
              infoField: "Under Shade",
              fieldName: "Tip Note",
            ),
          ),
        ),
      ],
    );
  }
}

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'Archivo',
              fontSize: 18,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              color: Colors.black54),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Archivo',
            fontSize: 37,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class IconFieldBuilder extends StatelessWidget {
  const IconFieldBuilder({
    super.key,
    required this.iconPath,
    required this.infoField,
    required this.fieldName,
  });

  final String iconPath;
  final String infoField;
  final String fieldName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(iconPath),
        ),
        Text(
          infoField,
          style: TextStyle(
            fontFamily: 'Archivo',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.85),
          ),
        ),
        Text(
          fieldName,
          style: TextStyle(
              fontFamily: 'Archivo',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.45)),
        )
      ],
    );
  }
}
