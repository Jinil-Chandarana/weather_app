import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyWeatherList extends StatefulWidget {
  const DailyWeatherList({super.key});
  // final double screenWidth;
  @override
  State<DailyWeatherList> createState() => _DayListState();
}

class _DayListState extends State<DailyWeatherList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white24)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.sunny_snowing,
                color: Colors.white,
              ),
              Text(
                DateFormat('d')
                    .format(DateTime.now().add(Duration(days: index))),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
