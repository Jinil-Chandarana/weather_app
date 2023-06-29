import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:weather_app/screens/current_details_screen.dart';
import 'package:weather_app/widgets/search_bar.dart';
import '../widgets/day_list.dart';
import '../controller/global_controller.dart';
import '../widgets/current_location_container.dart';
import '../widgets/popular_location.dart';

List<Widget> day = <Widget>[
  Text('Mon'),
  Text('Tue'),
  Text('Wed'),
  Text('Thu'),
  Text('Fri'),
  Text('Sat'),
  Text('Sun'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );
  final List<bool> _selectedDay = <bool>[
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SearchBar());
        },
        child: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 51, 55, 66),
        ),
      ),
      body: Obx(
        () => globalController.checkLoading().isTrue
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Text(
                        'Weather',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                    CurrentLocationContainer(
                      currentWeatherData: globalController
                          .getCurrentWeatherData()
                          .getCurrentWeather(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: DayList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Text(
                        'Popular Location',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const PopularLocation(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget daysList(double screenWidth) {
    return ToggleButtons(
      direction: vertical ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedDay.length; i++) {
            _selectedDay[i] = i == index;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(24)),
      selectedColor: Colors.white,
      fillColor: Colors.blue,
      color: Colors.white60,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 50,
      ),
      isSelected: _selectedDay,
      children: day,
    );
  }
}
