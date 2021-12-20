class Sources {
  Sources({
    String? title,
    String? slug,
    String? url,
    int? crawlRate,
  }) {
    _title = title;
    _slug = slug;
    _url = url;
    _crawlRate = crawlRate;
  }

  Sources.fromJson(dynamic json) {
    _title = json['title'];
    _slug = json['slug'];
    _url = json['url'];
    _crawlRate = json['crawl_rate'];
  }

  String? _title;
  String? _slug;
  String? _url;
  int? _crawlRate;

  String? get title => _title;

  String? get slug => _slug;

  String? get url => _url;

  int? get crawlRate => _crawlRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['slug'] = _slug;
    map['url'] = _url;
    map['crawl_rate'] = _crawlRate;
    return map;
  }
}
