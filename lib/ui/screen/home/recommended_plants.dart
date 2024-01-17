import 'package:flutter/material.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/ui/screen/home/plant_card.dart';

class RecommendedPlants extends StatelessWidget {
  const RecommendedPlants({super.key, required this.plants});

  final List<Plant> plants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: plants.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final currentPlant = plants[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PlantCard(
            plant: currentPlant,
            icon: currentPlant.isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            onPressed: null,
          ),
        );
      },
    );
  }
}
