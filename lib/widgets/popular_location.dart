import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/current_details_screen.dart';
import '../api/api_access_key.dart' as apikey;
import '../api/api_call.dart';
import '../controller/global_controller.dart';
import '../model/weather_data.dart';

class PopularLocation extends StatefulWidget {
  const PopularLocation({super.key});

  @override
  State<PopularLocation> createState() => _PopularLocationState();
}

class _PopularLocationState extends State<PopularLocation> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  final weatherData = WeatherData().obs;
  final RxBool _isLoading = true.obs;
  RxBool checkLoading() => _isLoading;

  List<String> popularLoactionList = [
    'Paris, Italy',
    'Madrid, Spain',
    'Rome, Italy',
    'Seoul, South Korea',
    'London, United Kingdom',
    'Kolkata, India',
  ];

  List<WeatherData> popularWeatherData = [];

  getPopularLocation() {
    for (final popularCity in popularLoactionList) {
      ApiCall()
          .processData(popularCity, apikey.apiAccessKey)
          .then((data) async {
        setState(() {
          weatherData.value = data;
          popularWeatherData.add(data);
        });
      });
    }
    _isLoading.value = false;
  }

  @override
  void initState() {
    if (_isLoading.isTrue) {
      getPopularLocation();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sleep(const Duration(milliseconds: 5));
    return Obx(
      () => checkLoading().isTrue
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: 400,
              child: ListView.builder(
                padding: const EdgeInsets.all(24),
                scrollDirection: Axis.horizontal,
                itemCount: (popularWeatherData.length ~/ 2),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      popularCityContainer(index),
                      popularCityContainer(
                          index + popularWeatherData.length ~/ 2)
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget popularCityContainer(int index) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      onTap: () =>
          Get.to(CurrentDetailsScreen(city: popularLoactionList[index])),
      child: Container(
        width: 300,
        height: 130,
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 51, 55, 66),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularWeatherData[index]
                              .getCurrentWeather()
                              .current
                              .temperature
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        ),
                        const Text(
                          '\u2103',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 100,
                      // height: ,
                      child: Text(
                        popularWeatherData[index]
                            .getCurrentWeather()
                            .current
                            .weatherDescriptions![0]
                            .toString(),
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white54,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  popularLoactionList[index],
                  style: const TextStyle(
                      color: Color.fromARGB(202, 255, 255, 255), fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              width: 50,
              child: Image.network(
                popularWeatherData[index]
                    .getCurrentWeather()
                    .current
                    .weatherIcons![0]
                    .toString(),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
