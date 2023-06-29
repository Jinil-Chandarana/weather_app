import 'package:flutter/material.dart';

List<Widget> day = <Widget>[
  const Text('Mon'),
  const Text('Tue'),
  const Text('Wed'),
  const Text('Thu'),
  const Text('Fri'),
  const Text('Sat'),
  const Text('Sun'),
];

class DayList extends StatefulWidget {
  const DayList({super.key});
  // final double screenWidth;
  @override
  State<DayList> createState() => _DayListState();
}

class _DayListState extends State<DayList> {
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
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
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
        constraints: BoxConstraints(
          minHeight: 40.0,
          minWidth: screenWidth / day.length,
        ),
        isSelected: _selectedDay,
        children: day,
      ),
    );
  }
}
