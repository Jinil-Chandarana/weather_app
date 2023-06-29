import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_data.dart';

class TempLarge extends StatelessWidget {
  const TempLarge({
    super.key,
    required this.weatherData,
  });
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              weatherData
                  .getCurrentWeather()
                  .current
                  .weatherIcons![0]
                  .toString(),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            '${weatherData.getCurrentWeather().current.temperature.toString()} \u2103',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            weatherData
                .getCurrentWeather()
                .current
                .weatherDescriptions![0]
                .toString(),
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
