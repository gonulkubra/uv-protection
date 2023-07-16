import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:testui2/servisler/weather_model.dart';

Future<Weather> getWeather(String city) async {
  final response = await http.get(Uri.parse(
      "http://api.weatherapi.com/v1/current.json?key=1d9502f66fe744a0ba785351232606&q={$city}.96&aqi=no"));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
