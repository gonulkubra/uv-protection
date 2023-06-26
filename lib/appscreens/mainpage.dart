// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testui2/servisler/weatherData.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

var today = DateTime.now();
var dateformat = DateFormat("EEE,d MMM").format(today);

class _MainPageState extends State<MainPage> {
  var city = "Istanbul";
  var client = WeatherData();
  var data;
  List<String> cities = ["Istanbul", "Ankara", "Izmir", "Kocaeli", "London"];

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
      padding: const EdgeInsets.only(top: 25.0),
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
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: size.height * 0.8,
        width: size.width,
        margin: EdgeInsets.only(right: 10, left: 10),
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
            citynamefield(),
            date(),
            SizedBox(height: 15),
            weathericon(size),
            SizedBox(height: 10),
            weatherstate(),
            iconsandinfos(size),
            otomattext()
          ],
        ),
      ),
    );
  }

  Padding citynamefield() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: cityname(),
    );
  }

  Image weathericon(Size size) {
    return Image.network(
      "https:${data?.icon}",
      width: size.width * 0.3,
      fit: BoxFit.fill,
    );
  }

  Padding iconsandinfos(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          firstcolumn(size),
          secondcolumn(size),
          thirdcolumn(size),
        ],
      ),
    );
  }

  Padding otomattext() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: TextButton(
          onPressed: () {},
          child: Text(
            "En yakın otomatı görmek için tıklayın",
            style: GoogleFonts.rajdhani(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.8)),
          )),
    );
  }

  Column thirdcolumn(Size size) {
    return Column(
      children: [
        SizedBox(height: 15),
        sfpvalue(),
        SizedBox(height: 15),
        stayhome(size),
        SizedBox(height: 10),
        stayhometext(),
        SizedBox(height: 10),
        spftext(),
      ],
    );
  }

  Column secondcolumn(Size size) {
    return Column(
      children: [
        SizedBox(height: 15),
        uvvalue(),
        SizedBox(height: 15),
        humidityimage(size),
        SizedBox(height: 10),
        humidityvalue(),
        SizedBox(height: 10),
        humiditytext(),
      ],
    );
  }

  Column firstcolumn(Size size) {
    return Column(
      children: [
        SizedBox(height: 15),
        temperature(),
        SizedBox(height: 15),
        windimage(size),
        SizedBox(height: 10),
        windspeed(),
        SizedBox(height: 10),
        windtext(),
      ],
    );
  }

  Text sfpvalue() {
    return Text(
      "SPF " + "${data?.spfvalue}",
      style: GoogleFonts.archivo(
          fontSize: 35,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text spftext() {
    return Text(
      "SPF",
      style: GoogleFonts.archivo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5)),
    );
  }

  Text stayhometext() {
    return Text(
      "Stay Home ",
      style: GoogleFonts.archivo(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Image stayhome(Size size) {
    return Image.asset(
      "assets/assets/home.png",
      width: size.width * 0.2,
      height: size.height * 0.08,
    );
  }

  Text humiditytext() {
    return Text(
      "Humidity",
      style: GoogleFonts.archivo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5)),
    );
  }

  Text humidityvalue() {
    return Text(
      "%" + "${data?.humidity}",
      style: GoogleFonts.archivo(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Image humidityimage(Size size) {
    return Image.asset(
      "assets/assets/humidity.png",
      width: size.width * 0.2,
      height: size.height * 0.08,
    );
  }

  Text uvvalue() {
    return Text(
      "${data?.uv}",
      style: GoogleFonts.archivo(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text windtext() {
    return Text(
      "Wind",
      style: GoogleFonts.archivo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.5)),
    );
  }

  Text windspeed() {
    return Text(
      "${data?.wind}" + " km/h",
      style: GoogleFonts.archivo(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  Image windimage(Size size) {
    return Image.asset("assets/assets/wind.png",
        width: size.width * 0.2, height: size.height * 0.08);
  }

  Text temperature() {
    return Text(
      "${data?.temp}" + "C",
      style: GoogleFonts.archivo(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.7)),
    );
  }

  Text weatherstate() {
    return Text(
      "${data?.condition}",
      style: GoogleFonts.archivo(fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Text date() {
    return Text(dateformat,
        style: GoogleFonts.archivo(fontSize: 18, fontWeight: FontWeight.w400));
  }

  Text cityname() {
    return Text(
      "${data?.cityname}",
      style: GoogleFonts.rajdhani(
          color: Colors.white, fontSize: 40, fontWeight: FontWeight.w800),
    );
  }
}
