import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String googleApiKey = "API_KEY";

String appversion = "2.0.0";

class Renkler {
  final girisekranlari = const Color.fromARGB(255, 137, 147, 241);
  final uygulamaici = const Color(0xffFFA3FD);
}

var today = DateTime.now();
var dateformat = DateFormat.yMMMMd().format(today);
var datetimeclock = DateFormat.Hm().format(today);
