class Weather {
  var cityname;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var uv;
  var spfvalue;

  Weather(
      {required this.cityname,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.uv,
      required this.spfvalue});

  Weather.fromJson(Map<String, dynamic> json) {
    cityname = json["location"]["name"];
    icon = json["current"]["condition"]["icon"];
    condition = json["current"]["condition"]["text"];
    temp = json["current"]["temp_c"];
    wind = json["current"]["wind_kph"];
    humidity = json["current"]["humidity"];
    uv = json["current"]["uv"];
    if (uv < 2) {
      spfvalue = 15;
    } else {
      spfvalue = 30;
    }
  }
}
