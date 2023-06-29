import 'dart:convert';

import 'package:weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;

import '../model/current_weather_data.dart';

class ApiCall {
  WeatherData? weatherData;

  Future<WeatherData> processData(query, apiAccessKey) async {
    var response = await http.get(Uri.parse(apiURL(query, apiAccessKey)));
    var jsonData = jsonDecode(response.body);

    weatherData = WeatherData(CurrentWeatherData.fromJson(jsonData));

    return weatherData!;
  }

  String apiURL(var query, var apiAccessKey) {
    String url;
    url =
        "http://api.weatherstack.com/current?access_key=${apiAccessKey}&query=${query}";
    return url;
  }
}
