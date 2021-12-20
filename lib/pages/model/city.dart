class City {
  City({
      int? distance, 
      String? title, 
      String? locationType, 
      int? woeid, 
      String? lattLong,}){
    _distance = distance;
    _title = title;
    _locationType = locationType;
    _woeid = woeid;
    _lattLong = lattLong;
}

  City.fromJson(dynamic json) {
    _distance = json['distance'];
    _title = json['title'];
    _locationType = json['location_type'];
    _woeid = json['woeid'];
    _lattLong = json['latt_long'];
  }
  int? _distance;
  String? _title;
  String? _locationType;
  int? _woeid;
  String? _lattLong;

  int? get distance => _distance;
  String? get title => _title;
  String? get locationType => _locationType;
  int? get woeid => _woeid;
  String? get lattLong => _lattLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distance'] = _distance;
    map['title'] = _title;
    map['location_type'] = _locationType;
    map['woeid'] = _woeid;
    map['latt_long'] = _lattLong;
    return map;
  }

}