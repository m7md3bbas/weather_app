import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStatusName;

  WeatherModel(
      {required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherStatusName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        maxTemp: jsondata['maxtemp_c'],
        minTemp: jsondata['mintemp_c'],
        temp: jsondata['avgtemp_c'],
        weatherStatusName: jsondata['condition']['text']);
  }
  @override
  String toString() {
    return 'temp : $temp  date : $date minTemp: $minTemp maxTemp : $maxTemp WeatherStatusName: $weatherStatusName';
  }

  String? getImage() {
    if (weatherStatusName == 'thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStatusName == 'snow') {
      return 'assets/images/snow.png';
    } else if (weatherStatusName == 'rainy' ||
        weatherStatusName == 'Heavy rain' ||
        weatherStatusName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStatusName == 'cloudy' ||
        weatherStatusName == 'partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStatusName == 'clear') {
      return 'assets/images/clear.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStatusName == 'thunderstorm') {
      return Colors.amber;
    } else if (weatherStatusName == 'snow') {
      return Colors.blue;
    } else if (weatherStatusName == 'rainy' ||
        weatherStatusName == 'Heavy rain' ||
        weatherStatusName == 'Moderate rain') {
      return Colors.blueGrey;
    } else if (weatherStatusName == 'cloudy' ||
        weatherStatusName == 'partly cloudy') {
      return Colors.brown;
    } else if (weatherStatusName == 'clear') {
      return Colors.cyan;
    } else {
      return Colors.green;
    }
  }
}
