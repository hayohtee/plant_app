
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class PlantInfo extends StatelessWidget {
  const PlantInfo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Constants.blackColor),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Constants.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
