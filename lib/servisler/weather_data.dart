import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testui2/servisler/weather_model.dart';

class WeatherData {
  Future<Weather> getData(String city) async {
    var uriCall = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=1d9502f66fe744a0ba785351232606&q={$city}.96&aqi=no");
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
