class Weather {
  String condition;
  String cityname;
  String icon;
  double temp;
  double wind;
  int humidity;
  double uv;
  String country;
  int isDay;
  Weather({
    required this.condition,
    required this.cityname,
    required this.icon,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.uv,
    required this.country,
    required this.isDay,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      condition: json["current"]["condition"]["text"],
      cityname: json["location"]["name"],
      country: json["location"]["country"],
      icon: json["current"]["condition"]["icon"],
      isDay: json["current"]["is_day"],
      temp: json["current"]["temp_c"],
      wind: json["current"]["wind_kph"],
      humidity: json["current"]["humidity"],
      uv: json["current"]["uv"],
    );
  }
}
