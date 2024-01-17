import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/ui/screen/home/plant_item.dart';
import 'package:plant_app/ui/screen/home/recommended_options.dart';
import 'package:plant_app/ui/screen/home/recommended_plants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final plantList = Plant.plantList;
  final plantTypes = <String>[
    'Recommended',
    'Indoor',
    'Outdoor',
    'Garden',
    'Supplement'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: const TextField(
                  showCursor: true,
                  cursorColor: Constants.primaryColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    hintText: 'Search Plant',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: RecommendedOptions(
                onSelect: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                options: plantTypes,
                selectedIndex: selectedIndex,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270,
              child: RecommendedPlants(plants: plantList),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'New Plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverList.builder(
              itemCount: plantList.length,
              itemBuilder: (context, index) {
                final currentPlant = plantList[index];
                return PlantItem(plant: currentPlant);
              },
            ),
          )
        ],
      ),
    );
  }
}
