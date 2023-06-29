import 'package:flutter/material.dart';
import '../model/weather_data.dart';
import 'current_details_subcontainer.dart';

class CurrentDetailsContainer extends StatelessWidget {
  const CurrentDetailsContainer({
    super.key,
    required this.city,
    required this.weatherData,
  });

  final String city;
  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 51, 55, 66),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrentDetailsSubcontainer(
                icon: Icons.blur_circular_outlined,
                data:
                    '${weatherData.getCurrentWeather().current.pressure.toString()} mb',
                dataTitle: 'Pressure',
              ),
              CurrentDetailsSubcontainer(
                icon: Icons.water_drop_outlined,
                data:
                    '${weatherData.getCurrentWeather().current.humidity.toString()} atm',
                dataTitle: 'Humidity',
              ),
              CurrentDetailsSubcontainer(
                icon: Icons.remove_red_eye_outlined,
                data:
                    '${weatherData.getCurrentWeather().current.visibility.toString()} km',
                dataTitle: 'Pressure',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrentDetailsSubcontainer(
                icon: Icons.wind_power_outlined,
                data:
                    '${weatherData.getCurrentWeather().current.windSpeed.toString()} kph',
                dataTitle: 'Wind',
              ),
              CurrentDetailsSubcontainer(
                icon: Icons.sunny,
                data:
                    weatherData.getCurrentWeather().current.uvIndex.toString(),
                dataTitle: 'UV',
              ),
              CurrentDetailsSubcontainer(
                icon: Icons.warning_amber,
                data:
                    '${weatherData.getCurrentWeather().current.feelslike.toString()} \u2103',
                dataTitle: 'Feels Like',
              ),
            ],
          )
        ],
      ),
    );
  }
}
