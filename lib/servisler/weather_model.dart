class Weather {
  var condition;
  var cityname;
  var icon;
  var temp;
  var wind;
  var humidity;
  var uv;
  var country;
  var isDay;
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
/*   
    if (uv <= 1) {
      statusText = "Drink Water";
      statusIcon = Icons.water;
    } else if (uv <= 3) {
      statusText = "Sunbath";
      statusIcon = Icons.warning;
    } else if (uv <= 7) {
      statusText = "Drink Water";
      statusIcon = Icons.warning;
    } else {
      statusText = "Stay at Home";
      statusIcon = Icons.chair;
    } */
  }
}
