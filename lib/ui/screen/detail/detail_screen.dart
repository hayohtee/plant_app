import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';
import 'package:plant_app/plants_provider.dart';
import 'package:plant_app/ui/screen/detail/detail_screen_app_bar.dart';
import 'package:plant_app/ui/screen/detail/detail_screen_body.dart';
import 'package:plant_app/ui/screen/detail/detail_screen_footer.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.plantId});

  final int plantId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final plant = context.select<PlantsProvider, Plant>(
      (provider) => provider.getPlantById(widget.plantId),
    );

    return Scaffold(
      body: Stack(
        children: [
          // App bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: DetailScreenAppBar(plant: plant),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: DetailScreenBody(plant: plant),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: DetailScreenFooter(plant: plant),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            context.read<PlantsProvider>().toggleSelected(plant.plantId);
          });
        },
        backgroundColor: plant.isSelected
            ? Constants.primaryColor.withOpacity(0.5)
            : Colors.white,
        foregroundColor:
            plant.isSelected ? Colors.white : Constants.primaryColor,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
