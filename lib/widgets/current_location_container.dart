import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/current_weather_data.dart';
import 'package:weather_app/screens/current_details_screen.dart';

import '../controller/global_controller.dart';

class CurrentLocationContainer extends StatefulWidget {
  const CurrentLocationContainer({
    super.key,
    required this.currentWeatherData,
  });

  final CurrentWeatherData currentWeatherData;

  @override
  State<CurrentLocationContainer> createState() =>
      _CurrentLocationContainerState();
}

class _CurrentLocationContainerState extends State<CurrentLocationContainer> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  String city = "";
  String country = "";

  getAddress(var latitude, var longitude) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(latitude, longitude);
    setState(() {
      city = placeMark[0].administrativeArea!;
      country = placeMark[0].country!;
      city = '$city,  $country';
    });
  }

  @override
  Widget build(BuildContext context) {
    final icon = widget.currentWeatherData.current.weatherIcons;

    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);

    return GestureDetector(
      onTap: () {
        Get.to(
          CurrentDetailsScreen(
            city: city,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(24),
        height: 150,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 51, 55, 66),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
                icon![0],
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.currentWeatherData.current.temperature}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      '\u2103',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      city,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
