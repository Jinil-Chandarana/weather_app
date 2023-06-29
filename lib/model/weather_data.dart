import 'package:weather_app/model/current_weather_data.dart';

class WeatherData {
  final CurrentWeatherData? current;
  WeatherData([this.current]);

  CurrentWeatherData getCurrentWeather() => current!;
}
