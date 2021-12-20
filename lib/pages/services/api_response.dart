import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/pages/model/city.dart';
import 'package:weather_forecast/pages/model/daily_weather.dart';

class WeatherAPIService {

  static String BASE_URL =
      "https://www.metaweather.com/";
  //https://www.metaweather.com/api/location/search/?lattlong=36.96,-122.02

  static Future<List<City>> getCities(String lattlong) async {
    var res = await Dio().get(
        BASE_URL+"api/location/search/", queryParameters: {"lattlong": lattlong});
    return List.from(res.data.map((e) => City.fromJson(e)));
  }

  static Future<DailyWeather> getDailyWeatherList(int woeid) async {
    var res = await Dio().get(BASE_URL+ "api/location/$woeid");
    return DailyWeather.fromJson(res.data);
  }


}