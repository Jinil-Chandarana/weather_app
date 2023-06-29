import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/popular_location.dart';

import 'screens/current_details_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 33, 36, 41),

        // brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
