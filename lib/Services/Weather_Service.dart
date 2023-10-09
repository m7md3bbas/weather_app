import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/pages/constant.dart';

class Service {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;

    try {
      http.Response response = await http.get(
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&aqi=no'));
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } on Exception catch (e) {
      print('');
    }

    return weather;
  }
}
