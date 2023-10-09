import 'package:flutter/material.dart';
import 'package:weather_app/models/Weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
