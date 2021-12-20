import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/pages/model/city.dart';
import 'package:weather_forecast/pages/services/api_response.dart';

class CityVM extends ChangeNotifier {

  List<City>  _cityList = [];
  List<City> get cityList => _cityList;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getLocation() async {
    Position position = await _determinePosition();
    return "${position.latitude},${position.longitude}";
  }


  CityVM(){
    getLocation().then((value) => WeatherAPIService.getCities(value).then((value) {
      _cityList = value;
      notifyListeners();
    }));
  }


}