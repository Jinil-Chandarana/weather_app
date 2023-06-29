class CurrentWeatherData {
  final Current current;
  CurrentWeatherData({required this.current});

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(
        current: Current.fromJson(
          json['current'],
        ),
      );
}

class Current {
  num? temperature;

  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  num? windSpeed;
  num? pressure;
  num? humidity;
  num? uvIndex;
  num? visibility;
  num? precip;
  num? feelslike;
  Current(
      {this.temperature,
      this.weatherIcons,
      this.weatherDescriptions,
      this.windSpeed,
      this.precip,
      this.pressure,
      this.humidity,
      this.uvIndex,
      this.visibility,
      this.feelslike});

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        temperature: num.tryParse(json['temperature'].toString()),
        weatherIcons: List<String>.from(json['weather_icons'] ?? []),
        weatherDescriptions:
            List<String>.from(json['weather_descriptions'] ?? []),
        windSpeed: num.tryParse(json['wind_speed'].toString()),
        pressure: num.tryParse(json['pressure'].toString()),
        precip: num.tryParse(json['precip'].toString()),
        humidity: num.tryParse(json['humidity'].toString()),
        feelslike: num.tryParse(json['feelslike'].toString()),
        uvIndex: num.tryParse(json['uv_index'].toString()),
        visibility: num.tryParse(json['visibility'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (temperature != null) 'temperature': temperature,
        if (weatherIcons != null) 'weather_icons': weatherIcons,
        if (weatherDescriptions != null)
          'weather_descriptions': weatherDescriptions,
        if (windSpeed != null) 'wind_speed': windSpeed,
        if (pressure != null) 'pressure': pressure,
        if (humidity != null) 'humidity': humidity,
        if (precip != null) 'precip': precip,
        if (precip != null) 'feelslike': feelslike,
        if (uvIndex != null) 'uv_index': uvIndex,
        if (visibility != null) 'visibility': visibility,
      };
}
