import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/pages/model/city.dart';
import 'daily_weather_vm.dart';

class DailyWeatherView extends StatelessWidget {
  const DailyWeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    City? city = context.read<DailyWeatherVM>().city;

    return Consumer<DailyWeatherVM>(builder: (c, s, w) {
      if (s.dailyWeather == null) {
        return Scaffold(appBar: AppBar(
          title: Text(" "),
        ),
          body: Material(color: Colors.white,child: Center(
            child: Image.asset("assets/loading_two.gif", height: 100,width: 100,),
          )),
        );
      }
      else{
        return Scaffold(
          backgroundColor: Colors.lightBlue[50],
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              "Weather Detail",
              style: TextStyle(fontFamily: 'RobotoMono', fontSize: 20),
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          city.title!,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          " / " + city.locationType!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    "https://www.metaweather.com/static/img/weather/png/"
                        "${s.dailyWeather!.consolidatedWeather![0].weatherStateAbbr!}.png",
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      s.dailyWeather!.consolidatedWeather![0].theTemp!
                          .toInt()
                          .toString() +
                          "°",
                      style: TextStyle(
                        fontSize: 50,
                      )),
                  Text(s.dailyWeather!.consolidatedWeather![0].weatherStateName!,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "H:" +
                        s.dailyWeather!.consolidatedWeather![0].maxTemp!
                            .toInt()
                            .toString() +
                        "°" +
                        " L:" +
                        s.dailyWeather!.consolidatedWeather![0].minTemp!
                            .toInt()
                            .toString() +
                        "°",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.grey[50],
                            shadowColor: Colors.indigo[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Humidity",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  s.dailyWeather!.consolidatedWeather![0]
                                      .humidity!
                                      .toInt()
                                      .toString() +
                                      "% ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Colors.grey[50],
                            shadowColor: Colors.indigo[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                               const Text("Wind Speed",
                                    style: TextStyle(fontSize: 16)),
                                Text(
                                  s.dailyWeather!.consolidatedWeather![0]
                                      .windSpeed!
                                      .toStringAsFixed(3) +
                                      " km/h",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.grey[50],
                            shadowColor: Colors.indigo[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                const Text(
                                  "Wind Direction",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  s.dailyWeather!.consolidatedWeather![0]
                                      .windDirection!
                                      .toStringAsFixed(2) +
                                      "°",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Colors.grey[50],
                            shadowColor: Colors.indigo[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                const Text("Air Pressure",
                                    style: TextStyle(fontSize: 16)),
                                Text(
                                  s.dailyWeather!.consolidatedWeather![0]
                                      .airPressure!
                                      .toStringAsFixed(0) +
                                      "mbar",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/calendar.png", width: 25,height: 25,color: Colors.black,),
                        const Text(
                          " 6 -DAY FORECAST",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: s.dailyWeather!.consolidatedWeather!
                          .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                  e.applicableDate!,
                                  style: const TextStyle(fontSize: 16),
                                )),
                            Expanded(
                              child: Image.network(
                                "https://www.metaweather.com/static/img/weather/png/${e.weatherStateAbbr}.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                            Expanded(
                                child: Text( "L : "+
                                    e.minTemp!.toInt().toStringAsFixed(0),
                                    style: const TextStyle(fontSize: 16))),
                            Expanded(
                                child: Text("H : "+
                                    e.maxTemp!.toInt().toStringAsFixed(0),
                                    style: const TextStyle(fontSize: 16))),
                          ],
                        ),
                      ))
                          .toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }

    });
  }
}
