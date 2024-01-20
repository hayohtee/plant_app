import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/plants_provider.dart';
import 'package:plant_app/ui/component/plant_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritePlants = context.select<PlantsProvider, List<Plant>>(
      (provider) => provider.getFavoritePlants(),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: favoritePlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/favorite.png',
                      height: 100,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'No favorite plants',
                      style: TextStyle(
                        color: Constants.primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: favoritePlants.length,
                itemBuilder: ((context, index) {
                  final currentPlant = favoritePlants[index];
                  return PlantItem(plant: currentPlant);
                }),
              ),
      ),
    );
  }
}
