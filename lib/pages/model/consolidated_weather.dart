class Consolidated_weather {
  Consolidated_weather({
    int? id,
    String? weatherStateName,
    String? weatherStateAbbr,
    String? windDirectionCompass,
    String? created,
    String? applicableDate,
    double? minTemp,
    double? maxTemp,
    double? theTemp,
    double? windSpeed,
    double? windDirection,
    double? airPressure,
    int? humidity,
    double? visibility,
    int? predictability,}) {
    _id = id;
    _weatherStateName = weatherStateName;
    _weatherStateAbbr = weatherStateAbbr;
    _windDirectionCompass = windDirectionCompass;
    _created = created;
    _applicableDate = applicableDate;
    _minTemp = minTemp;
    _maxTemp = maxTemp;
    _theTemp = theTemp;
    _windSpeed = windSpeed;
    _windDirection = windDirection;
    _airPressure = airPressure;
    _humidity = humidity;
    _visibility = visibility;
    _predictability = predictability;

  }



  Consolidated_weather.fromJson(dynamic json) {
    _id = json['id'];
    _weatherStateName = json['weather_state_name'];
    _weatherStateAbbr = json['weather_state_abbr'];
    _windDirectionCompass = json['wind_direction_compass'];
    _created = json['created'];
    _applicableDate = json['applicable_date'];
    _minTemp = json['min_temp'];
    _maxTemp = json['max_temp'];
    _theTemp = json['the_temp'];
    _windSpeed = json['wind_speed'];
    _windDirection = json['wind_direction'];
    _airPressure = json['air_pressure'];
    _humidity = json['humidity'];
    _visibility = json['visibility'];
    _predictability = json['predictability'];
  }

  int? _id;
  String? _weatherStateName;
  String? _weatherStateAbbr;
  String? _windDirectionCompass;
  String? _created;
  String? _applicableDate;
  double? _minTemp;
  double? _maxTemp;
  double? _theTemp;
  double? _windSpeed;
  double? _windDirection;
  double? _airPressure;
  int? _humidity;
  double? _visibility;
  int? _predictability;

/*
  * val iconUrl: String
        get() = String.format(
            "https://www.metaweather.com/static/img/weather/png/$weatherStateAbbr.png",
            weatherStateAbbr
        )
  *
  * */
  int? get id => _id;

  String? get weatherStateName => _weatherStateName;

  String? get weatherStateAbbr => _weatherStateAbbr;

  String? get windDirectionCompass => _windDirectionCompass;

  String? get created => _created;

  String? get applicableDate => _applicableDate;

  double? get minTemp => _minTemp;

  double? get maxTemp => _maxTemp;

  double? get theTemp => _theTemp;

  double? get windSpeed => _windSpeed;

  double? get windDirection => _windDirection;

  double? get airPressure => _airPressure;

  int? get humidity => _humidity;

  double? get visibility => _visibility;

  int? get predictability => _predictability;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['weather_state_name'] = _weatherStateName;
    map['weather_state_abbr'] = _weatherStateAbbr;
    map['wind_direction_compass'] = _windDirectionCompass;
    map['created'] = _created;
    map['applicable_date'] = _applicableDate;
    map['min_temp'] = _minTemp;
    map['max_temp'] = _maxTemp;
    map['the_temp'] = _theTemp;
    map['wind_speed'] = _windSpeed;
    map['wind_direction'] = _windDirection;
    map['air_pressure'] = _airPressure;
    map['humidity'] = _humidity;
    map['visibility'] = _visibility;
    map['predictability'] = _predictability;
    return map;
  }
}