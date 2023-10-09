import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/Weather_Provider.dart';
import 'package:weather_app/Services/Weather_Service.dart';
import 'package:weather_app/models/Weather_model.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              Service service = Service();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: 'Enter a City',
                label: Text('Search'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      Service service = Service();
                      WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = cityName;
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search))),
          ),
        ),
      ),
    );
  }
}
