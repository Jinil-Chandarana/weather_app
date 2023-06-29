import 'current.dart';
import 'location.dart';
import 'request.dart';

class Weather {
  Request? request;
  Location? location;
  Current? current;

  Weather({this.request, this.location, this.current});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        request: json['request'] == null
            ? null
            : Request.fromJson(Map<String, dynamic>.from(json['request'])),
        location: json['location'] == null
            ? null
            : Location.fromJson(Map<String, dynamic>.from(json['location'])),
        current: json['current'] == null
            ? null
            : Current.fromJson(Map<String, dynamic>.from(json['current'])),
      );

  Map<String, dynamic> toJson() => {
        if (request != null) 'request': request?.toJson(),
        if (location != null) 'location': location?.toJson(),
        if (current != null) 'current': current?.toJson(),
      };
}
