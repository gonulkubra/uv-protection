// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testui2/servisler/weatherData.dart';
import 'package:testui2/sabitler/sehirler.dart';
import 'package:testui2/sabitler/kalicisabitler.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var city = "Istanbul";
  var client = WeatherData();
  var data;

  info() async {
    data = await client.getData("$city");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        return Container(
          child: Column(
            children: [
              dropdown(),
              citycard(size),
            ],
          ),
        );
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
                  });
                }),
          ),
        ],
      ),
    );
  }

  Padding citycard(Size size) {
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
                colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.3, 0.7])),
        child: Column(
          children: [
            SizedBox(height: 4),
            sehirisimalani(),
            ulke(),
            SizedBox(height: 4),
            tarih(),
            SizedBox(height: 8),
            havaiconu(size),
            SizedBox(height: 5),
            havadurumu(),
            SizedBox(height: 18),
            iconlar(size),
            SizedBox(height: 12),
            otomattext()
          ],
        ),
      ),
    );
  }

  Text ulke() => Text("${data?.country}");

  Padding sehirisimalani() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: sehiradi(),
    );
  }

  Image havaiconu(Size size) {
    return Image.network(
      "https:${data?.icon}",
      width: size.width * 0.3,
      fit: BoxFit.fill,
    );
  }

  Padding iconlar(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ilksutun(size),
          ikincisutun(size),
          ucuncusutun(size),
        ],
      ),
    );
  }

  Padding otomattext() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: TextButton(
          onPressed: () => Navigator.pushNamed(context, "/AutomatScreen"),
          child: Text(
            "En yakın otomatı görmek için tıklayın",
            style: GoogleFonts.rajdhani(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.8)),
          )),
    );
  }

  Column ucuncusutun(Size size) {
    return Column(
      children: [
        Text(
          "SPF",
          style: GoogleFonts.archivo(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        spfdegeri(),
        SizedBox(height: 15),
        evdekalicon(size),
        SizedBox(height: 10),
        evdekalyazi(),
        SizedBox(height: 10),
        durumyazi(),
      ],
    );
  }

  Column ikincisutun(Size size) {
    return Column(
      children: [
        Text(
          "UV",
          style: GoogleFonts.archivo(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        uvdegeri(),
        SizedBox(height: 15),
        nemiconu(size),
        SizedBox(height: 10),
        nemdegeri(),
        SizedBox(height: 10),
        nemyazi(),
      ],
    );
  }

  Column ilksutun(Size size) {
    return Column(
      children: [
        Text(
          "Sıcaklık",
          style: GoogleFonts.archivo(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.5)),
        ),
        SizedBox(height: 8),
        sicaklik(),
        SizedBox(height: 15),
        ruzgaricon(size),
        SizedBox(height: 10),
        ruzgarhizi(),
        SizedBox(height: 10),
        ruzgaryazi(),
      ],
    );
  }

  Text spfdegeri() {
    return Text(
      "SPF " + "${data?.spfvalue}",
      style: GoogleFonts.archivo(
          fontSize: 35,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text durumyazi() {
    return Text(
      "Durum",
      style: GoogleFonts.archivo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5)),
    );
  }

  Text evdekalyazi() {
    return Text(
      "Evde Kal ",
      style: GoogleFonts.archivo(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Image evdekalicon(Size size) {
    return Image.asset(
      "assets/assets/home.png",
      width: size.width * 0.2,
      height: size.height * 0.08,
    );
  }

  Text nemyazi() {
    return Text(
      "Nem",
      style: GoogleFonts.archivo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5)),
    );
  }

  Text nemdegeri() {
    return Text(
      "%" + "${data?.humidity}",
      style: GoogleFonts.archivo(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Image nemiconu(Size size) {
    return Image.asset(
      "assets/assets/humidity.png",
      width: size.width * 0.2,
      height: size.height * 0.08,
    );
  }

  Text uvdegeri() {
    return Text(
      "${data?.uv}",
      style: GoogleFonts.archivo(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text ruzgaryazi() {
    return Text(
      "Rüzgar",
      style: GoogleFonts.archivo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5)),
    );
  }

  Text ruzgarhizi() {
    return Text(
      "${data?.wind}" + " km/s",
      style: GoogleFonts.archivo(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Image ruzgaricon(Size size) {
    return Image.asset("assets/assets/wind.png",
        width: size.width * 0.2, height: size.height * 0.08);
  }

  Text sicaklik() {
    return Text(
      "${data?.temp}" + "°C",
      style: GoogleFonts.archivo(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text havadurumu() {
    return Text(
      "${data?.condition}",
      style: GoogleFonts.archivo(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Text tarih() {
    return Text(dateformat,
        style: GoogleFonts.archivo(fontSize: 18, fontWeight: FontWeight.w400));
  }

  Text sehiradi() {
    return Text(
      "${data?.cityname}",
      style: GoogleFonts.rajdhani(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
    );
  }
}
