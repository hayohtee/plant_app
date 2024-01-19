import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/plants_provider.dart';
import 'package:plant_app/ui/screen/detail/detail_screen.dart';
import 'package:plant_app/ui/screen/home/plant_card.dart';
import 'package:provider/provider.dart';

class PlantCategories extends StatefulWidget {
  const PlantCategories({super.key});

  @override
  State<PlantCategories> createState() => _PlantCategoriesState();
}

class _PlantCategoriesState extends State<PlantCategories> {
  int selectedIndex = 0;
  final plantCategories = <String>[
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement'
  ];

  @override
  Widget build(BuildContext context) {
    final plants = context.watch<PlantsProvider>().getPlantsByCategory();

    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            itemCount: plantCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    final plantCategory = plantCategories[index];
                    context
                        .read<PlantsProvider>()
                        .updatePlantCategory(plantCategory);
                  },
                  child: Text(
                    plantCategories[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.w300,
                      color: selectedIndex == index
                          ? Constants.primaryColor
                          : Constants.blackColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: plants.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final currentPlant = plants[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetailScreen(plantId: currentPlant.plantId),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: PlantCard(
                    plant: currentPlant,
                    icon: currentPlant.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    onPressed: () {
                      setState(() {
                        context
                            .read<PlantsProvider>()
                            .toggleFavorite(currentPlant.plantId);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
