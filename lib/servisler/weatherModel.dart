class Weather {
  var cityname;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var uv;
  var spfvalue;
  var country;
  var isDay;
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
    country = json["location"]["country"];
    icon = json["current"]["condition"]["icon"];
    condition = json["current"]["condition"]["text"];
    temp = json["current"]["temp_c"];
    wind = json["current"]["wind_kph"];
    humidity = json["current"]["humidity"];
    uv = json["current"]["uv"];
    isDay = json["current"]["is_day"];
    if (uv < 2) {
      spfvalue = 15;
    } else {
      spfvalue = 30;
    }
  }
}
