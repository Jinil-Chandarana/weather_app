class Location {
  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  num? localtimeEpoch;
  String? utcOffset;

  Location({
    this.name,
    this.country,
    this.region,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtime,
    this.localtimeEpoch,
    this.utcOffset,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name']?.toString(),
        country: json['country']?.toString(),
        region: json['region']?.toString(),
        lat: json['lat']?.toString(),
        lon: json['lon']?.toString(),
        timezoneId: json['timezone_id']?.toString(),
        localtime: json['localtime']?.toString(),
        localtimeEpoch: num.tryParse(json['localtime_epoch'].toString()),
        utcOffset: json['utc_offset']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (country != null) 'country': country,
        if (region != null) 'region': region,
        if (lat != null) 'lat': lat,
        if (lon != null) 'lon': lon,
        if (timezoneId != null) 'timezone_id': timezoneId,
        if (localtime != null) 'localtime': localtime,
        if (localtimeEpoch != null) 'localtime_epoch': localtimeEpoch,
        if (utcOffset != null) 'utc_offset': utcOffset,
      };
}
