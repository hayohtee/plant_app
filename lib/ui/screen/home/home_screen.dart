import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/plants_provider.dart';
import 'package:plant_app/ui/screen/detail/detail_screen.dart';
import 'package:plant_app/ui/screen/home/plant_categories.dart';
import 'package:plant_app/ui/screen/home/plant_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final plantList = context.select<PlantsProvider, List<Plant>>(
      (provider) => provider.plantList,
    );

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
          const SliverToBoxAdapter(child: PlantCategories()),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetailScreen(plantId: currentPlant.plantId),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: PlantItem(plant: currentPlant),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
