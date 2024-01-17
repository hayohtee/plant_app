import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imageUrl,
          height: 320,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Constants.primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
