import 'package:weather_forecast/pages/model/parent.dart';
import 'package:weather_forecast/pages/model/sources.dart';

import 'consolidated_weather.dart';

class DailyWeather {
  DailyWeather({
    List<Consolidated_weather>? consolidatedWeather,
    String? time,
    String? sunRise,
    String? sunSet,
    String? timezoneName,
    Parent? parent,
    List<Sources>? sources,
    String? title,
    String? locationType,
    int? woeid,
    String? lattLong,
    String? timezone,
  }) {
    _consolidatedWeather = consolidatedWeather;
    _time = time;
    _sunRise = sunRise;
    _sunSet = sunSet;
    _timezoneName = timezoneName;
    _parent = parent;
    _sources = sources;
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
    _timezone = timezone;
  }

  DailyWeather.fromJson(dynamic json) {
    if (json['consolidated_weather'] != null) {
      _consolidatedWeather = [];
      json['consolidated_weather'].forEach((v) {
        _consolidatedWeather?.add(Consolidated_weather.fromJson(v));
      });
    }
    _time = json['time'];
    _sunRise = json['sun_rise'];
    _sunSet = json['sun_set'];
    _timezoneName = json['timezone_name'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Sources.fromJson(v));
      });
    }
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
    _timezone = json['timezone'];
  }

  List<Consolidated_weather>? _consolidatedWeather;
  String? _time;
  String? _sunRise;
  String? _sunSet;
  String? _timezoneName;
  Parent? _parent;
  List<Sources>? _sources;
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;
  String? _timezone;

  List<Consolidated_weather>? get consolidatedWeather => _consolidatedWeather;

  String? get time => _time;

  String? get sunRise => _sunRise;

  String? get sunSet => _sunSet;

  String? get timezoneName => _timezoneName;

  Parent? get parent => _parent;

  List<Sources>? get sources => _sources;

  String? get title => _title;

  String? get locationType => _locationType;

  int? get woeid => _woeid;

  String? get lattLong => _lattLong;

  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_consolidatedWeather != null) {
      map['consolidated_weather'] =
          _consolidatedWeather?.map((v) => v.toJson()).toList();
    }
    map['time'] = _time;
    map['sun_rise'] = _sunRise;
    map['sun_set'] = _sunSet;
    map['timezone_name'] = _timezoneName;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    if (_sources != null) {
      map['sources'] = _sources?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    map['timezone'] = _timezone;
    return map;
  }
}
