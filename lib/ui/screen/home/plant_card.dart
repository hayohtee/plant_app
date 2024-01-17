import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({
    super.key,
    required this.plant,
    required this.icon,
    required this.onPressed,
  });

  final Plant plant;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Constants.primaryColor.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: SizedBox(
        width: 200,
        child: Stack(
          children: [
            Positioned(
              top: 10,
              right: 8,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(icon),
                    color: Constants.primaryColor,
                    iconSize: 30,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              right: 40,
              top: 40,
              bottom: 60,
              child: Image.asset(plant.imageURL),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.category,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    plant.plantName,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              right: 8,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Text(
                    '\$${plant.price}',
                    style: const TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
