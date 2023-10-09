import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/Weather_Provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/pages/SearchPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SearchPage(
                    updateUi: updateUi,
                  );
                },
              ));
            },
          )
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Text(
                    'updated: ${weatherData!.date}',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('${weatherData!.getImage()}'),
                        Text(
                          'Temp: ${weatherData!.temp.toInt()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 30),
                        ),
                        Column(
                          children: [
                            Text(
                              'maxTemp${weatherData!.maxTemp.toInt()}',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text('minTemp:${weatherData!.minTemp.toInt()}',
                                style: TextStyle(fontSize: 20))
                          ],
                        )
                      ]),
                  SizedBox(height: 60),
                  Text(
                    weatherData!.weatherStatusName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
    );
  }
}
