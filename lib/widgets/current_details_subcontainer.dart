import 'package:flutter/material.dart';

class CurrentDetailsSubcontainer extends StatelessWidget {
  const CurrentDetailsSubcontainer({
    super.key,
    required this.data,
    required this.dataTitle,
    required this.icon,
  });

  final IconData icon;
  final String data;
  final String dataTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          data,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 4,
        ),
        Text(dataTitle, style: TextStyle(color: Colors.white54)),
      ],
    );
  }
}
