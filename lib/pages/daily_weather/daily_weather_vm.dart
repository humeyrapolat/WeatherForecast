import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/pages/model/city.dart';
import 'package:weather_forecast/pages/model/daily_weather.dart';
import 'package:weather_forecast/pages/services/api_response.dart';

class DailyWeatherVM extends ChangeNotifier {

  City city;
  DailyWeather? dailyWeather ;

  DailyWeatherVM(this.city){
    WeatherAPIService.getDailyWeatherList(city.woeid!).then((value){
      dailyWeather = value;
      notifyListeners();
    });
  }
}