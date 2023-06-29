import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/widgets/current_details_container.dart';

import '../api/api_call.dart';
import '../controller/global_controller.dart';
import '../model/weather_data.dart';
import '../api/api_access_key.dart' as apikey;
import '../widgets/day_list.dart';
import '../widgets/temp_large.dart';
import '../widgets/daily_weather_list.dart';

class CurrentDetailsScreen extends StatefulWidget {
  const CurrentDetailsScreen({
    super.key,
    required this.city,
    // required this.countryName,
  });

  final String city;
  // final String countryName;

  @override
  State<CurrentDetailsScreen> createState() => _CurrentDetailsScreenState();
}

class _CurrentDetailsScreenState extends State<CurrentDetailsScreen> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  final weatherData = WeatherData().obs;
  final RxBool _isLoading = true.obs;
  RxBool checkLoading() => _isLoading;

  @override
  void initState() {
    ApiCall().processData(widget.city, apikey.apiAccessKey).then((value) async {
      setState(() {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Obx(
      () => checkLoading().isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: () {
                    Get.to(const HomeScreen());
                  },
                ),
                backgroundColor: const Color.fromARGB(255, 33, 36, 41),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${widget.city}, ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const DayList(),
                      const SizedBox(
                        height: 30,
                      ),
                      TempLarge(weatherData: weatherData.value),
                      const SizedBox(
                        height: 30,
                      ),
                      CurrentDetailsContainer(
                        city: widget.city,
                        weatherData: weatherData.value,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const DailyWeatherList(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
