import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/Weather_Provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemeColor()),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
