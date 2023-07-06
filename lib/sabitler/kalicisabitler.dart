// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const String google_api_key = "API_KEY";

String appversion = "1.0.0";

class Renkler {
  final girisekranlari = Color(0xffE7CEA6);
  final uygulamaici = Color(0xffFFA3FD);
}

var today = DateTime.now();
var dateformat = DateFormat.yMMMMd().format(today);
var datetimeclock = DateFormat.Hm().format(today);
