import 'package:flutter/material.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/ui/screen/detail/plant_info.dart';

class DetailScreenBody extends StatelessWidget {
  const DetailScreenBody({super.key, required this.plant});

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          child: Image.asset(plant.imageURL),
        ),
        Positioned(
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlantInfo(
                title: 'Size',
                value: plant.size,
              ),
              const SizedBox(height: 8),
              PlantInfo(
                title: 'Humidity',
                value: plant.humidity.toString(),
              ),
              const SizedBox(height: 8),
              PlantInfo(
                title: 'Temperature',
                value: plant.temperature,
              ),
            ],
          ),
        )
      ],
    );
  }
}
