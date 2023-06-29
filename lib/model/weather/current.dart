class Current {
  String? observationTime;
  num? temperature;
  num? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  num? windSpeed;
  num? windDegree;
  String? windDir;
  num? pressure;
  num? precip;
  num? humidity;
  num? cloudcover;
  num? feelslike;
  num? uvIndex;
  num? visibility;
  String? isDay;

  Current({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
    this.isDay,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        observationTime: json['observation_time']?.toString(),
        temperature: num.tryParse(json['temperature'].toString()),
        weatherCode: num.tryParse(json['weather_code'].toString()),
        weatherIcons: List<String>.from(json['weather_icons'] ?? []),
        weatherDescriptions:
            List<String>.from(json['weather_descriptions'] ?? []),
        windSpeed: num.tryParse(json['wind_speed'].toString()),
        windDegree: num.tryParse(json['wind_degree'].toString()),
        windDir: json['wind_dir']?.toString(),
        pressure: num.tryParse(json['pressure'].toString()),
        precip: num.tryParse(json['precip'].toString()),
        humidity: num.tryParse(json['humidity'].toString()),
        cloudcover: num.tryParse(json['cloudcover'].toString()),
        feelslike: num.tryParse(json['feelslike'].toString()),
        uvIndex: num.tryParse(json['uv_index'].toString()),
        visibility: num.tryParse(json['visibility'].toString()),
        isDay: json['is_day']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (observationTime != null) 'observation_time': observationTime,
        if (temperature != null) 'temperature': temperature,
        if (weatherCode != null) 'weather_code': weatherCode,
        if (weatherIcons != null) 'weather_icons': weatherIcons,
        if (weatherDescriptions != null)
          'weather_descriptions': weatherDescriptions,
        if (windSpeed != null) 'wind_speed': windSpeed,
        if (windDegree != null) 'wind_degree': windDegree,
        if (windDir != null) 'wind_dir': windDir,
        if (pressure != null) 'pressure': pressure,
        if (precip != null) 'precip': precip,
        if (humidity != null) 'humidity': humidity,
        if (cloudcover != null) 'cloudcover': cloudcover,
        if (feelslike != null) 'feelslike': feelslike,
        if (uvIndex != null) 'uv_index': uvIndex,
        if (visibility != null) 'visibility': visibility,
        if (isDay != null) 'is_day': isDay,
      };
}
